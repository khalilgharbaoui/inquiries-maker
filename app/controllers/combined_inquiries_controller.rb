# frozen_string_literal: true

class CombinedInquiriesController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :allow_iframe_requests!, only: %i[new create]
  before_action :set_combined_inquiry, only: %i[show edit update destroy]
  prepend ParentThankYouPageUrlMaker

  def index
    @combined_inquiries = CombinedInquiry.all if user_signed_in?
  end

  def show; end

  def new
    @combined_inquiry = CombinedInquiry.new
  end

  def edit; end

  def create
    @combined_inquiry = CombinedInquiry.new(combined_inquiry_params)

    respond_to do |format|
      if @combined_inquiry.save
        format.html { redirect_to parent_thank_you_page }
      else
        format.html { render :new }
      end
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

  def allow_iframe_requests!
    response.headers.delete('X-Frame-Options')
  end

  def set_combined_inquiry
    @combined_inquiry = CombinedInquiry.find(params[:id])
  end

  def combined_inquiry_params
    params.require(:combined_inquiry).permit(:moving_street_and_number, :moving_postal_code, :moving_city, :moving_date, :cleaning_date, InquiryConcern::COMMON_PARAMS)
  end
end
