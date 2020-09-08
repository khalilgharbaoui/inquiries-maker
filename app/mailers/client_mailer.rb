# frozen_string_literal: true

class ClientMailer < ApplicationMailer
  prepend InquiryTicketHelper
  prepend InquiryDatetimeHelper
  helper :markdown

  def client(response_body, inquiry)
    I18n.with_locale(inquiry.locale) do
      @continue_url = response_body.dig(:continue_url)
      @inquiry = inquiry
      @inquiry_name = t(".inquiry.#{inquiry.class.name.underscore.downcase}")
      @client_salutation = t("#{@inquiry.class.name.pluralize.underscore}.form.client_salutations.#{inquiry.client_salutation}")
      @partner = Cre.dig(:partner_name)
      @partner_support_email = Cre.dig(:partner_support_email)
      @uos = Cre.dig(:uos)
      @uos_logo_path = Cre.dig(:uos_logo_path)
      @uos_url = Cre.dig(:uos_url)
      @uos_email = Cre.dig(:uos_email)
      @inquiry_creation_date = inquiry_creation_date(inquiry) # DD.MM.YYYY
      @inquiry_creation_time = inquiry_creation_time(inquiry)
      @inquiry_conclusion_date = inquiry_conclusion_date(inquiry) # DD.MM.YYYY
      @ticket = ticket(response_body)
      @ga_ua = Cre.dig(:ga_ua)

      sender = Cre.dig(:sender_email)

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
end
