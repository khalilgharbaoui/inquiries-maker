# frozen_string_literal: true

class CombinedInquiriesController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :allow_iframe_requests!, only: %i[new create]
  before_action :set_combined_inquiry, only: %i[show edit update destroy]
  prepend ParentThankYouPageUrlMaker
  include RescheduleInquiryDelivery

  def index
    @combined_inquiries = CombinedInquiry.order("id DESC").all.includes([:received_inquiry_response]) if user_signed_in?
  end

  def show; end

  def new
    @combined_inquiry = CombinedInquiry.new
  end

  def edit; end

  def create
    @combined_inquiry = CombinedInquiry.new(combined_inquiry_params)
    respond_to do |format|
      @combined_inquiry.save ? flash_and_redirect(format) : format.html { render :new }
    end
  end

  def update
    respond_to do |format|
      if @combined_inquiry.update(combined_inquiry_params)
        format.html { redirect_to combined_inquiry_path, notice: t('.combined_inquiry_was_successfully_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @combined_inquiry.destroy
    respond_to do |format|
      format.html { redirect_to combined_inquiries_url, notice: t('.combined_inquiry_was_successfully_destroyed') }
      # format.json { head :no_content }
    end
  end

  private

  def flash_and_redirect(format)
    flash[:notice] = t('.inquiry_was_successfully_created')
    if Rails.env.to_sym == :production
      format.html { render partial: 'shared/local_thank_you_page', locals: { url: parent_thank_you_page_url } }
    else
      format.html { render :new }
    end
  end

  def allow_iframe_requests!
    response.headers.delete('X-Frame-Options')
  end

  def set_combined_inquiry
    @combined_inquiry = CombinedInquiry.find(params[:id])
  end

  def combined_inquiry_params
    params.require(:combined_inquiry).permit(:moving_street_and_number, :moving_postal_code, :moving_city, :moving_date, :cleaning_date, InquiryParams::COMMON_PARAMS)
  end
end
