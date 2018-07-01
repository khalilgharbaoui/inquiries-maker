# frozen_string_literal: true

class CleaningInquiriesController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :set_cleaning_inquiry, only: %i[show edit update destroy]

  # GET /cleaning_inquiries
  # GET /cleaning_inquiries.json
  def index
    @cleaning_inquiries = CleaningInquiry.all if user_signed_in?
  end

  # GET /cleaning_inquiries/1
  # GET /cleaning_inquiries/1.json
  def show; end

  # GET /cleaning_inquiries/new
  def new
    @cleaning_inquiry = CleaningInquiry.new
  end

  # GET /cleaning_inquiries/1/edit
  def edit; end

  # POST /cleaning_inquiries
  # POST /cleaning_inquiries.json
  def create
    @cleaning_inquiry = CleaningInquiry.new(cleaning_inquiry_params)

    respond_to do |format|
      if @cleaning_inquiry.save
        format.html { redirect_to cleaning_inquiry_path, notice: t('.cleaning_inquiry_was_successfully_created') }
        # format.json { render :show, status: :created, location: @cleaning_inquiry }
      else
        format.html { render :new }
        # format.json { render json: @cleaning_inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cleaning_inquiries/1
  # PATCH/PUT /cleaning_inquiries/1.json
  def update
    respond_to do |format|
      if @cleaning_inquiry.update(cleaning_inquiry_params)
        format.html { redirect_to cleaning_inquiry_path, notice: t('.cleaning_inquiry_was_successfully_updated') }
        # format.json { render :show, status: :ok, location: @cleaning_inquiry }
      else
        format.html { render :edit }
        # format.json { render json: @cleaning_inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cleaning_inquiries/1
  # DELETE /cleaning_inquiries/1.json
  def destroy
    @cleaning_inquiry.destroy
    respond_to do |format|
      format.html { redirect_to cleaning_inquiries_url, notice: t('.cleaning_inquiry_was_successfully_destroyed') }
      # format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cleaning_inquiry
    @cleaning_inquiry = CleaningInquiry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cleaning_inquiry_params
    params.require(:cleaning_inquiry).permit(:cleaning_date, InquiryHelper::COMMON_PARAMS)
  end
end
