module RescheduleInvoiceDelivery
  def reschedule_invoice
    schedule_invoicing_job
    flash[:notice] = "✅Invoice email rescheduled!"
    redirect_to action:'index', locale: nil
  end

  private

  def schedule_invoicing_job
    InvoiceDeliveryJob.perform_later(params_quarter)
  end

  def params_quarter
    params[:quarter]
  end
end
