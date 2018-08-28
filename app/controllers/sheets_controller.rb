class SheetsController < ApplicationController
  before_action :authenticate_user!

  def show
    @inquiries = if params[:quarter]
      ReceivedInquiryResponse.order("id DESC").where('quarter = ?', params[:quarter])
    else
      ReceivedInquiryResponse.order("id DESC")
    end
    response.headers['Content-Disposition'] = 'inline'
    render xlsx: @inquiries, disposition: 'inline',
           filename: "uos-leads-list#{'-' + params[:quarter].tr(' ','-') if params[:quarter]}.xlsx",
           xlsx_created_at: 1.day.ago,
           xlsx_author: "Umzug Offerte Schweiz",
           template: 'sheets/show'
  end
end
