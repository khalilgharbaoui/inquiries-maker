class SheetsController < ApplicationController
  before_action :authenticate_user!

  def show
    @inquiries = received_inquiry_responces(params[:quarter])
    response.headers['Content-Disposition'] = 'inline'
    render xlsx: @inquiries, disposition: 'inline',
           filename: "uos-leads-list#{'-' + params[:quarter].tr(' ','-') if params[:quarter]}.xlsx",
           xlsx_created_at: 1.day.ago,
           xlsx_author: "Umzug Offerte Schweiz",
           template: 'sheets/show'
  end

  private

  def received_inquiry_responces(params)
    if params
        ReceivedInquiryResponse.order("id DESC").where('quarter = ?', params)
    else
        ReceivedInquiryResponse.order("id DESC")
    end
  end
end
