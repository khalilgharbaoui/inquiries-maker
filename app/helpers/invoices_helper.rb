module InvoicesHelper

  # def invoice_received?(quarter)
  # TODO: create functionality to see email opens for invoice
  #   find_received_inquiry_response_body(inquiry).first || link_to_reschedule(inquiry)
  # end


  def details(inquiries)
    inquiries.group_by{|batch| batch.response_body['original_kind']}
             .map{|arr| {type: arr[0], quantity: arr[1].count}}
  end

  def price(hash)
    sprintf "%.2f", inquiry_price(hash).round(2)
  end

  def sub_total(hash)
    sprintf "%.2f", inquiries_price(hash).round(2)
  end

  def total(inquiries)
    prices = []
    details(inquiries).each do |hash|
      prices << inquiries_price(hash)
    end
    sprintf "%.2f", prices.sum.round(2)
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

  def detail(string)
    Rails.application.credentials.dig(Rails.env.to_sym, :"#{string}").to_s
  end

  def reciever_name
    detail('partner_reciever_email').split(' ')[0]
  end

  def quarter(inquiries)
    inquiries.map(&:quarter)[0]
  end

  def filename(inquiries)
    quarter(inquiries).parameterize
  end

  private

  def inquiry_price(hash)
    BigDecimal.new (hash[:type].to_s + 'Inquiry').camelcase.constantize::PRICE
  end

  def inquiries_price(hash)
    hash[:quantity] * inquiry_price(hash)
  end
end
