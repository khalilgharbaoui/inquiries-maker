module RescheduleInvoiceDelivery
  def reschedule_invoice
    InvoiceDeliveryJob.perform_later(quarter)
    flash[:notice] = "✅Invoice email rescheduled!"
    redirect_to action:'index', locale: nil
  end

  private

  def quarter
    params[:quarter]
  end
end
