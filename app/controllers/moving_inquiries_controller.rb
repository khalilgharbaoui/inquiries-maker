# frozen_string_literal: true

class MovingInquiriesController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :set_moving_inquiry, only: %i[show edit update destroy]

  def index
    @moving_inquiries = MovingInquiry.all if user_signed_in?
  end

  def show; end

  def new
    @moving_inquiry = MovingInquiry.new
  end

  def edit; end

  def create
    @moving_inquiry = MovingInquiry.new(moving_inquiry_params)

    respond_to do |format|
      if @moving_inquiry.save
        format.html { redirect_to new_moving_inquiry_path, notice: t('.moving_inquiry_was_successfully_created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @moving_inquiry.update(moving_inquiry_params)
        format.html { redirect_to moving_inquiry_path, notice: t('.moving_inquiry_was_successfully_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @moving_inquiry.destroy
    respond_to do |format|
      format.html { redirect_to moving_inquiries_url, notice: t('.moving_inquiry_was_successfully_destroyed') }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_moving_inquiry
    @moving_inquiry = MovingInquiry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def moving_inquiry_params
    params.require(:moving_inquiry).permit(:moving_street_and_number, :moving_postal_code, :moving_city, :moving_date, InquiryConcern::COMMON_PARAMS)
  end
end
