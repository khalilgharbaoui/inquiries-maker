# frozen_string_literal: true

class CleaningInquiriesController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :allow_iframe_requests!, only: %i[new create]
  before_action :set_cleaning_inquiry, only: %i[show edit update destroy]
  prepend ParentThankYouPageUrlMaker
  include RescheduleInquiryDelivery

  def index
    @cleaning_inquiries = CleaningInquiry.order("id DESC").all if user_signed_in?
  end

  def show; end

  def new
    @cleaning_inquiry = CleaningInquiry.new
  end

  def edit; end

  def create
    @cleaning_inquiry = CleaningInquiry.new(cleaning_inquiry_params)

    respond_to do |format|
      if @cleaning_inquiry.save
        flash[:notice] = t(".inquiry_was_successfully_created")
        format.html { render partial: "shared/local_thank_you_page", locals: {url: parent_thank_you_page_url} }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @cleaning_inquiry.update(cleaning_inquiry_params)
        format.html { redirect_to cleaning_inquiry_path, notice: t('.cleaning_inquiry_was_successfully_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @cleaning_inquiry.destroy
    respond_to do |format|
      format.html { redirect_to cleaning_inquiries_url, notice: t('.cleaning_inquiry_was_successfully_destroyed') }
    end
  end

  private

  def allow_iframe_requests!
    response.headers.delete('X-Frame-Options')
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_cleaning_inquiry
    @cleaning_inquiry = CleaningInquiry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cleaning_inquiry_params
    params.require(:cleaning_inquiry).permit(:cleaning_date, InquiryParams::COMMON_PARAMS)
  end
end
