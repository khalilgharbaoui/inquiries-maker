# frozen_string_literal: true

module InvoicesHelper
  # def invoice_received?(quarter)
  # TODO: create functionality to see email opens for invoice
  #   find_received_inquiry_response_body(inquiry).first || link_to_reschedule(inquiry)
  # end

  def details(inquiries)
    inquiries.group_by { |batch| batch.response_body['original_kind'] }
             .map { |arr| { type: arr[0], quantity: arr[1].count } }
  end

  def price(hash)
    format '%.2f', inquiry_price(hash).round(2)
  end

  def sub_total(hash)
    format '%.2f', inquiries_price(hash).round(2)
  end

  def total(inquiries)
    prices = []
    details(inquiries).each do |hash|
      prices << inquiries_price(hash)
    end
    format '%.2f', prices.sum.round(2)
  end

  def count_and_subtotal(hash_element)
    return '---' if hash_element.nil?

    hash_element[:quantity].to_s + ' / ' + 'CHF' + sub_total(hash_element).to_s
  end

  def count_and_total(collection)
    collection.count.to_s + ' / ' + 'CHF' + total(collection).to_s
  end

  def top(i)
    284 + i * 12
  end

  def inquiry_type(batch)
    t("invoices.show.pdf.details.#{batch[:type]}")
  end

  def invoice_nr(inquiries)
    "##{from_date(inquiries).strftime('%m%Y')}-#{until_date(inquiries).strftime('%m%Y')}"
  end

  def invoice_date(inquiries)
    invoice = inquiries.first.invoice
    invoice.present? ? invoice.created_at.to_s(:swiss_date_format) : Date.today.to_s(:swiss_date_format)
  end

  def invoice_first_send_date(inquiries)
    invoice = inquiries.lazy.first.invoice
    if invoice.present?
      date = invoice&.created_at&.to_s(:swiss_date_format_with_time)
      date
    else
      'none!'
    end
  end

  def invoice_send_count(inquiries)
    invoice = inquiries.lazy.first.invoice
    if invoice.present?
      invoice.send_count
    else
      'none!'
    end
  end

  def invoice_mutation_date(inquiries)
    invoice = inquiries.first.invoice
    if invoice.present?
      date = if invoice.created_at == invoice.updated_at
               invoice.created_at.to_s(:swiss_date_format_with_time)
             else
               invoice.updated_at.to_s(:swiss_date_format_with_time)
      end
      date
    else
      'none!'
    end
  end

  def detail(string)
    Cre.dig(string.to_sym).to_s
  end

  def reciever_name
    Cre.dig(:partner_reciever_email).split(' ')[0]
  end

  def quarter(inquiries)
    inquiries.map(&:quarter)[0]
  end

  def filename(inquiries)
    quarter(inquiries).parameterize
  end

  def zoom_level
    # Ugly but the only workaround for now when using Alpine Linux
    return 1.3 unless RUBY_PLATFORM.match?(/linux-musl/)

    RUBY_PLATFORM.match?(/linux-musl/) ? 1.3 : 1
  end

  private

  def inquiry_price(arg)
    BigDecimal((arg[:type].to_s + 'Inquiry').camelcase.constantize::PRICE)
  end

  def inquiries_price(h)
    h[:quantity] * inquiry_price(h)
  end
end
