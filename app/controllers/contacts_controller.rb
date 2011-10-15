class ContactsController < ApplicationController

  def new
    @contact = Contact.new(:id => 1)
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      #Notifier.contact(@contact).deliver
      redirect_to root_path, :notice => "Din email blev sendt, vi kontakter dig."
    else
      render :new, :error => "Din email blev ikke sendt."
    end
  end

end
