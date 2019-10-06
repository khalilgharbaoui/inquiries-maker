# frozen_string_literal: true

class InvoiceMailer < ApplicationMailer
  track open: true, click: false
  include InvoicesHelper
  helper :sheets
  helper :invoices
  helper :application
  helper :markdown

  def invoice(inquiries)
    @quarter = quarter(inquiries)
    @reciever_name = reciever_name
    @uos = Cre.dig(:uos)
    @uos_logo_path = Cre.dig(:uos_logo_path)
    @uos_contact = Cre.dig(:uos_contact).split(' ').last.humanize
    @uos_url = Cre.dig(:uos_url)
    @uos_email = Cre.dig(:uos_email)

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
      print_media_type: false,
      disable_smart_shrinking: true,
      zoom: zoom_level
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
    reciever = Cre.dig(:invoices_receiver)
    sender = Cre.dig(:sender_email)
    cc = [Cre.dig(:invoices_watcher), Cre.dig(:partner_reciever_email)]

    mail to: reciever,
         from: sender,
         cc: cc,
         subject: t('invoice_mailer.invoice.subject', quarter: @quarter, locale: :en),
         reply_to: sender,
         importance: 'High',
         sensitivity: 'private',
         language: 'EN',
         sender: sender do |format|
      format.html
      format.text # { render locals: { inquiries: inquiries }}
    end
    # end
  end
end
