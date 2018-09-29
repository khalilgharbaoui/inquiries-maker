# frozen_string_literal: true

class ResponseLogger
  attr_reader :response

  def initialize(response)
    @response = response
  end

  def self.log(response)
    new(response).send(:log)
  end

  private

  def log
    status
    response_body
  end

  def status
    warn 'STATUS:'
    warn "CODE: #{response.code}" if response.code # => '200'
    warn "MESSAGE: #{response.message}" if response.message # => 'OK'
    warn "CLASS NAME: #{response.class.name}" if response.class.name # => 'HTTPOK'
  end

  # def headers
  #   # warn "Headers: "
  #    # warn JSON::PrettyPrint.prettify(response.to_json) if response
  # end

  def response_body
    warn 'RESPONSE BODY: '
    warn JSON::PrettyPrint.prettify(response.body).to_s if response.body
    warn '⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️'
  end
end
