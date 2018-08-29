class SheetsController < ApplicationController
  before_action :authenticate_user!

  def show
    @inquiries = received_inquiry_responces(params[:quarter])
    # response.headers['Content-Disposition'] = 'inline'
    render xlsx: @inquiries, disposition: 'attachment',
           filename: "uos-leads-list#{'-' + params[:quarter].tr(' ','-') if params[:quarter]}.xlsx",
           xlsx_created_at: 1.day.ago,
           xlsx_author: "Umzug Offerte Schweiz",
           template: 'sheets/show'
  end

  private

  def received_inquiry_responces(params)
    params ? ReceivedInquiryResponse.where('quarter = ?', params) : ReceivedInquiryResponse.all
  end
end
