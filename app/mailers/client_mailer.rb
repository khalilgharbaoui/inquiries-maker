class ClientMailer < ApplicationMailer

  def client(moving_inquiry_id)
    moving_inquiry = MovingInquiry.find(moving_inquiry_id)
    @client = moving_inquiry

    mail to: "#{moving_inquiry.client_last_name} <#{moving_inquiry.client_email}>",
      from: "Umzug Offerte Schweiz <info@umzug-offetre-schweiz.com>",
      subject: "#{moving_inquiry.client_last_name}, Thank you for your request!"
  end
end
