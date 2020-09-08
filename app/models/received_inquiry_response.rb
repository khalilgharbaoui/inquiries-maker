# frozen_string_literal: true

# == Schema Information
#
# Table name: received_inquiry_responses
#
#  id                  :bigint(8)        not null, primary key
#  quarter             :string
#  response_body       :jsonb            not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  cleaning_inquiry_id :bigint(8)
#  combined_inquiry_id :bigint(8)
#  moving_inquiry_id   :bigint(8)
#
# Indexes
#
#  index_received_inquiry_responses_on_cleaning_inquiry_id  (cleaning_inquiry_id)
#  index_received_inquiry_responses_on_combined_inquiry_id  (combined_inquiry_id)
#  index_received_inquiry_responses_on_moving_inquiry_id    (moving_inquiry_id)
#  index_received_inquiry_responses_on_response_body        (response_body)
#
# Foreign Keys
#
#  fk_rails_...  (cleaning_inquiry_id => cleaning_inquiries.id)
#  fk_rails_...  (combined_inquiry_id => combined_inquiries.id)
#  fk_rails_...  (moving_inquiry_id => moving_inquiries.id)
#

class ReceivedInquiryResponse < ApplicationRecord
  before_save ResponseBodyWrapper.new
  before_create :set_quarter
  belongs_to :moving_inquiry, optional: true
  belongs_to :cleaning_inquiry, optional: true
  belongs_to :combined_inquiry, optional: true
  belongs_to :invoice, class_name: 'Invoice', foreign_key: 'quarter',
                       primary_key: 'quarter', optional: true, inverse_of: :inquiries
  after_commit :send_telegram_notification, on: :create

  scope :kind_per_quarter, ->(quarter, kind) {
    where(quarter: quarter).where('response_body @> ? OR response_body @> ?', { raw_json: { kind: kind.to_s } }.to_json, { kind: kind.to_s }.to_json)
  }

  # TODO: Replace the next 2 lines  with polymorphism
  scope :with_kind, ->(kind) { where('response_body @> ? OR response_body @> ?', { raw_json: { kind: kind.to_s } }.to_json, { kind: kind.to_s }.to_json) }
  INQUIRY_KINDS = %i[moving cleaning combined].freeze

  def self.monthly_grouped_by_kind_for_chart(options = {})
    INQUIRY_KINDS.map do |kind|
      {
        name: kind,
        data: with_kind(kind).group_by_month(:created_at, format: '%b %Y').count
      }.merge!(options)
    end << quarters_values_for_chart_by(quarters_averages, 'average')
  end

  def self.quarterly_grouped_by_kind_for_chart(options = {})
    INQUIRY_KINDS.map do |kind|
      data = with_kind(kind).group_by_quarter(:created_at, format: '%b %Y').count
      {
        name: kind,
        data: quarterly_performance(data),
      }.merge!(options)
    end
  end

  private

  def self.quarters_values_for_chart_by(data, name)
    {
      name: name,
      data: data,
      dataset: {
        type: 'line',
        fill: false,
        spanGaps: true,
        lineTension: 0,
        # borderDash: [9, 9],
        pointStyle: 'line'
      }
    }
  end
  
  def self.quarters_averages 
    months_quarter_average(values_per_quarter)
  end

  def self.months_quarter_average(values_per_quarter)
    results = {}
    values_per_quarter.each do |key, value|
      quarter = key.split(' ').first
      year = key.split(' ').last
      case quarter
      when '1'
        %w[Jan Feb Mar].each do |month|
          results["#{month} #{year}"] = (value.sum / 4)
        end
      when '2'
        %w[Apr May Jun].each do |month|
          results["#{month} #{year}"] = (value.sum / 4)
        end
      when '3'
        %w[Jul Aug Sep].each do |month|
          results["#{month} #{year}"] = (value.sum / 4)
        end
      when '4'
        %w[Oct Nov Dec].each do |month|
          results["#{month} #{year}"] = (value.sum / 4)
        end
      end
    end
    results
  end

  def self.values_per_quarter
    count_by_month = group_by_month(:created_at, format: '%b %Y').count

    values_per_quarter = {}
    count_by_month.each do |key, value|
      quarter = Date.parse(key).quarter
      year = Date.parse(key).year
      new_key = "#{quarter} #{year}"
      if values_per_quarter[new_key]&.is_a?(Array)
        values_per_quarter[new_key] << value
      else
        values_per_quarter[new_key] = [value]
      end
    end 
    values_per_quarter  
  end

  def self.quarterly_performance(quarter_values)
    labeled_by_quarter = {}
    quarter_values.each do |key, value|
      quarter = Date.parse(key.to_s).quarter
      year = Date.parse(key.to_s).year
      labeled_by_quarter["Q#{quarter} #{year}"] = value
    end
    labeled_by_quarter
  end

  def set_quarter
    self.quarter = "Q#{Date.parse(created_at.to_s).quarter} #{Date.parse(created_at.to_s).year}"
  end

  def send_telegram_notification
    Rails.env.to_sym == :production ? TelegramNotifier.new(self) : warn("ℹ️  #{self.class.name} => ##{id}")
  end
end
