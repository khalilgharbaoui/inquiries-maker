class SheetsController < ApplicationController
  def index
    @inquiries = if params[:quarter]
      ReceivedInquiryResponse.order("id DESC").where(quarter: params[:quarter].upcase)
    else
      ReceivedInquiryResponse.order("id DESC").all
    end

    render xlsx: 'index', filename: "uos-leads-list#{params[:quarter].gsub(" ","_") if params[:quarter]}.xlsx", disposition: 'inline',
      xlsx_created_at: 1.days.ago, xlsx_author: "Umzug Offerte Schweiz"#, template: nil,
  end
end
