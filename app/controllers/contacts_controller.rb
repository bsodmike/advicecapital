class ContactsController < ApplicationController
  respond_to :html, :xml, :json

  def new
    respond_with(@contact_form = ContactForm.new)
  end

  def send_email
    @contact_form = ContactForm.new(params[:contact_form])

    if @contact_form.valid?
      Notifications.contact(@contact_form).deliver
      redirect_to root_path, :notice => "Email sendt, vi kontakter dig."
    else
      render :new
    end
  end

end
