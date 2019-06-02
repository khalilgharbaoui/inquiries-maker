# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action :authenticate_user!
  include RescheduleInvoiceDelivery

  def index
    @inquiries = ReceivedInquiryResponse.order('id DESC')
  end

  def show
    @inquiries = ReceivedInquiryResponse.where('quarter = ?', params[:quarter])
    render pdf: file_name(@inquiries),
           template: 'invoices/show.pdf',
           layout: false,
           page_size: 'A4',
           encoding: 'UTF-8',
           dpi: '300',
           # viewport_size: "1280x1024",
           page_height: '297mm',
           page_width: '210mm',
           handlers: [:slim],
           margin: { left: '3mm', right: '3mm', top: '0mm', bottom: '0mm' },
           print_media_type: false,
           disable_smart_shrinking: true,
           zoom: zoom_level,
           show_as_html: params.key?('debug'),
           progress: proc { |output| puts output }# allow debugging based on url param
  end

  private

  def file_name(inquiries)
    helpers.detail('uos').tr(' ', '-') + '-Invoice-' + inquiries.first.quarter.tr(' ', '-')
  end

  def zoom_level
    # Ugly but the only workaround for now when using Alpine Linux
    return 1.3 unless RUBY_PLATFORM.match?(/linux-musl/)

    RUBY_PLATFORM.match?(/linux-musl/) ? 1.3 : 1
  end
end
