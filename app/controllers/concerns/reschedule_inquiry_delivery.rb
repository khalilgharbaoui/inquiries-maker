module RescheduleInquiryDelivery
  def reschedule_inquiry
    schedule_inquiry_delivery_job
    flash[:notice] = "✅Inquiry delivery rescheduled!"
    redirect_to action: 'index'
  end

  def schedule_inquiry_delivery_job
    msg = {inquiry_name: inquiry.class.name, inquiry_id: inquiry.id}.to_json
    InquiryDeliveryWorker.enqueue(msg) unless inquiry.client_email == Cre.dig(:gmail_username)
  end

  private

  def inquiry_type
    params[:controller].split("_").first
  end

  def inquiry
    # http://api.rubyonrails.org/classes/String.html#method-i-safe_constantize
    klass = "#{inquiry_type}_inquiry".classify.safe_constantize
    klass.find(params[:id])
  end
end
