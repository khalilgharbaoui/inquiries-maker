module RescheduleInquiryDelivery
  def reschedule_inquiry
    InquiryDeliveryJob.perform_later(inquiry)
    flash[:notice] = "✅Inquiry delivery rescheduled!"
    redirect_to :action => 'index'
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
