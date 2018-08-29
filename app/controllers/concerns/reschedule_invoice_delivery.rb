module RescheduleInvoiceDelivery
  def reschedule_invoice
    schedule_invoice_email_job
    flash[:notice] = "✅Invoice email rescheduled!"
    redirect_to action:'index', locale: nil
  end

  def schedule_invoice_email_job
    InvoiceDeliveryWorker.enqueue(params_quarter)
  end

  private

  def params_quarter
    params[:quarter]
  end
end
