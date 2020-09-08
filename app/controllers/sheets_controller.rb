class SheetsController < ApplicationController
  before_action :authenticate_user!

  def show
    @inquiries = received_inquiry_responces(params[:quarter])
    # response.headers['Content-Disposition'] = 'inline'
    render xlsx: @inquiries, disposition: 'attachment',
           filename: "uos-leads-list#{'-' + params[:quarter].tr(' ', '-') if params[:quarter]}.xlsx",
           xlsx_created_at: 1.day.ago,
           xlsx_author: 'Umzug Offerte Schweiz',
           template: 'sheets/show',
           handlers: [:axlsx]
  end

  private

  def received_inquiry_responces(params)
    if params
      ReceivedInquiryResponse.where('quarter = ?', params.to_s).includes(%i[moving_inquiry cleaning_inquiry combined_inquiry])
    else
      ReceivedInquiryResponse.all.includes(%i[moving_inquiry cleaning_inquiry combined_inquiry])
    end
  end
end
