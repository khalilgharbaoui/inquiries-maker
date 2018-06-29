# frozen_string_literal: true

class ClientMailer < ApplicationMailer
  helper :markdown
  def client(response_body, inquiry)
    @continue_url = response_body[:continue_url]
    @inquiry = inquiry
    @inquiry_name = t(".inquiry.#{inquiry.class.name.underscore.downcase}")
    @client_salutation = t("#{@inquiry.class.name.pluralize.underscore}.form.client_salutations.#{inquiry.client_salutation}")
    sender = Rails.application.credentials.dig(Rails.env.to_sym, :sender_email)

    mail to: "#{inquiry.client_last_name} #{inquiry.client_first_name}\
    <#{inquiry.client_email}>",
     'Reply-To': sender,
     'Importance': 'High',
     'Sensitivity': 'private',
     'Language': @inquiry.locale,
     'Sender': sender,
     from: sender,
     subject: t('.complete_your_inquiry.subject', inquiry: @inquiry_name) do |format|
       format.html
       format.text
    end
  end
end
