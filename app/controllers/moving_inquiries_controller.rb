# frozen_string_literal: true

class MovingInquiriesController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :set_moving_inquiry, only: %i[show edit update destroy]

  # GET /moving_inquiries
  # GET /moving_inquiries.json
  def index
    @moving_inquiries = MovingInquiry.all if user_signed_in?
  end

  # GET /moving_inquiries/1
  # GET /moving_inquiries/1.json
  def show; end

  # GET /moving_inquiries/new
  def new
    @moving_inquiry = MovingInquiry.new
  end

  # GET /moving_inquiries/1/edit
  def edit; end

  # POST /moving_inquiries
  # POST /moving_inquiries.json
  def create
    @moving_inquiry = MovingInquiry.new(moving_inquiry_params)

    respond_to do |format|
      if @moving_inquiry.save
        format.html { redirect_to new_moving_inquiry_path, notice: 'Moving inquiry was successfully created.' }
        format.json { render :show, status: :created, location: @moving_inquiry }
      else
        format.html { render :new }
        # format.html { url_for(action: :new, locale: I18n.locale)}
        format.json { render json: @moving_inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moving_inquiries/1
  # PATCH/PUT /moving_inquiries/1.json
  def update
    respond_to do |format|
      if @moving_inquiry.update(moving_inquiry_params)
        format.html { redirect_to moving_inquiry_path, notice: 'Moving inquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @moving_inquiry }
      else
        format.html { render :edit }
        format.json { render json: @moving_inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moving_inquiries/1
  # DELETE /moving_inquiries/1.json
  def destroy
    @moving_inquiry.destroy
    respond_to do |format|
      format.html { redirect_to moving_inquiries_url, notice: 'Moving inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_moving_inquiry
    @moving_inquiry = MovingInquiry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def moving_inquiry_params
    params.require(:moving_inquiry).permit(:moving_street_and_number, :moving_postal_code, :moving_city, :moving_date, InquiryHelper::COMMON_PARAMS)
  end
end
