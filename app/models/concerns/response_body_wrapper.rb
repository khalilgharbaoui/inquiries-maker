class ResponseBodyWrapper
  def before_save(record)
    record.response_body = JSON.parse(record.response_body)
  end
end
