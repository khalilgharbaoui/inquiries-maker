# frozen_string_literal: true

class ResponseBodyWrapper
  def before_save(record)
    record.response_body = JSON.parse(record.response_body.force_encoding('utf-8'))
  end
end
