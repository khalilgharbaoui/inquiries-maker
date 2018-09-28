class MovuJsonBuilder
  def initialize(inquiry)
    @inquiry = inquiry
  end

  def call
    build_json
  end

  private

  def build_json
    @inquiry.as_json(except: exclusions).merge(inclusions).to_json
  end

  def inclusions
    credentials.merge(utm_params)
  end

  def exclusions
    %i[id created_at updated_at origin hostname path referrer ip]
  end

  def utm_params
    {
      utm_campaign: 'umzug-offerte-schweiz',
      utm_term: 'umzug-offerte-schweiz',
      utm_content: 'umzug-offerte-schweiz'
    }
  end

  def credentials
    {
      origin: 'thirdparty_partner',
      partner_token: Cre.dig(:partner_token)
    }
  end
end
