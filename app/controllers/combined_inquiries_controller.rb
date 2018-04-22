class CombinedInquiriesController < ApplicationController
  before_action :set_combined_inquiry, only: [:show, :edit, :update, :destroy]

  # GET /combined_inquiries
  # GET /combined_inquiries.json
  def index
    @combined_inquiries = CombinedInquiry.all
  end

  # GET /combined_inquiries/1
  # GET /combined_inquiries/1.json
  def show
  end

  # GET /combined_inquiries/new
  def new
    @combined_inquiry = CombinedInquiry.new
  end

  # GET /combined_inquiries/1/edit
  def edit
  end

  # POST /combined_inquiries
  # POST /combined_inquiries.json
  def create
    @combined_inquiry = CombinedInquiry.new(combined_inquiry_params)

    respond_to do |format|
      if @combined_inquiry.save
        format.html { redirect_to @combined_inquiry, notice: 'Combined inquiry was successfully created.' }
        format.json { render :show, status: :created, location: @combined_inquiry }
      else
        format.html { render :new }
        format.json { render json: @combined_inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /combined_inquiries/1
  # PATCH/PUT /combined_inquiries/1.json
  def update
    respond_to do |format|
      if @combined_inquiry.update(combined_inquiry_params)
        format.html { redirect_to @combined_inquiry, notice: 'Combined inquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @combined_inquiry }
      else
        format.html { render :edit }
        format.json { render json: @combined_inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combined_inquiries/1
  # DELETE /combined_inquiries/1.json
  def destroy
    @combined_inquiry.destroy
    respond_to do |format|
      format.html { redirect_to combined_inquiries_url, notice: 'Combined inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_combined_inquiry
      @combined_inquiry = CombinedInquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def combined_inquiry_params
      params.require(:combined_inquiry).permit(:is_moving_request, :is_cleaning_request, :moving_street_and_number, :moving_postal_code, :moving_date, :cleaning_date, InquiryHelper::COMMON_PARAMS)
    end
end
