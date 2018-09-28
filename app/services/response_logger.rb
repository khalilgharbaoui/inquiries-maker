class ResponseLogger
  def initialize(response, inquiry)
    @response = response
    @inquiry = inquiry
  end

  def call
    status
    response_body
  end

  private
    attr_reader :response, :inquiry

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
      warn "#{JSON::PrettyPrint.prettify(response.body)}" if response.body
      warn '⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️'
      warn "LEAD ID: #{inquiry.id} !!"
      warn "LEAD ID: #{inquiry.class.name} !!"
    end
end
