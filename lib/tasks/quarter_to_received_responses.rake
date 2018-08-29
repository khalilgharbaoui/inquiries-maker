# frozen_string_literal: true

namespace :received_inquiry_responses do
  desc 'calculate and fill the quarter field'
  task set_quarter: :environment do
    responses = ReceivedInquiryResponse.all
    warn "Going to update #{responses.count} responses"

    ActiveRecord::Base.transaction do
      responses.each do |response|
        response.update(
          response_body: response.response_body.to_json,
          quarter: "Q#{(response.created_at.month / 3.0).ceil} #{response.created_at.year}"
        )
        print '✅'
      end
      warn ' All done now!'
    end
  end
end
