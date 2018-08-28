module RescheduleInvoiceDelivery
  def reschedule_invoice
    InvoiceDeliveryJob.perform_later(params_quarter)
    flash[:notice] = "✅Invoice email rescheduled!"
    redirect_to action:'index', locale: nil
  end

  private

  def params_quarter
    params[:quarter]
  end
end
