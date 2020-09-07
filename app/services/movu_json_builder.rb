class MovuJsonBuilder
  attr_reader :inquiry

  def initialize(inquiry)
    @inquiry = inquiry
  end

  def self.build(inquiry)
    new(inquiry).send(:build)
  end

  private

  def build
    json = { inquiry: inquiry.as_json(except: exclusions).merge(inclusions) }.to_json
    puts JSON::PrettyPrint.prettify(json)
    json
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
