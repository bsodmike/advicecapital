class ContactsController < ApplicationController
  respond_to :html

  def show
    redirect_to new_contacts_path
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.valid?
      Notifier.contact(@contact).deliver
      redirect_to root_path, :notice => "Email sendt, vi kontakter dig."
    else
      render :new
    end
  end

end
