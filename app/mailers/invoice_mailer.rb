# frozen_string_literal: true

class InvoiceMailer < ApplicationMailer
  include InvoicesHelper
  helper :sheets
  helper :invoices
  helper :application
  helper :markdown

  def invoice(inquiries)

    @inquiries = inquiries

    xlsx = Base64.encode64(
      render_to_string(
        layout: false,
        handlers: [:axlsx],
        formats: [:xlsx],
        template: 'sheets/show',
        locals: { inquiries: inquiries }
      )
    )

    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(
        layout: false,
        handlers: [:slim],
        formats: [:pdf],
        template: 'invoices/show',
        locals: { inquiries: inquiries }
      ),
      page_size: 'A4',
      encoding: 'UTF-8',
      dpi: '300',
      page_height: '297mm',
      page_width: '210mm',
      margin: { left: '3mm', right: '3mm', top: '0mm', bottom: '0mm' },
      print_media_type:               false,
      disable_smart_shrinking:        true,
      zoom: 1
    )

    attachments["uos-leads_list-#{filename(inquiries)}.xlsx"] = {
      mime_type: Mime[:xlsx],
      content: xlsx,
      encoding: 'base64'
    }
    attachments["uos-invoice-#{filename(inquiries)}.pdf"] = {
      mime_type: Mime[:pdf],
      content: pdf
    }

    # I18n.with_locale(nil) do
    reciever = (Rails.application.credentials.dig(Rails.env.to_sym, :partner_reciever_email).split(' ')[0]).to_s + " <#{Rails.application.credentials.dig(Rails.env.to_sym, :gmail_username)}>"
    sender = Rails.application.credentials.dig(Rails.env.to_sym, :uos) + " <#{Rails.application.credentials.dig(Rails.env.to_sym, :uos_email)}>"
    cc = Rails.application.credentials.dig(Rails.env.to_sym, :invoices_watcher)

    mail to: reciever,
         from: sender,
         cc: cc,
         subject: t('invoice_mailer.invoice.subject', quarter: quarter(inquiries), locale: :en),
         'Reply-To': sender,
         'Importance': 'High',
         'Sensitivity': 'private',
         'Language': 'EN',
         'Sender': sender do |format|
        format.text # { render locals: { inquiries: inquiries }}
    end
    # end
  end
end
