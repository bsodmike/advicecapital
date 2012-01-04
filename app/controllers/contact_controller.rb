class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    if Contact.contact(params[:message][:message], params[:message][:email], params[:message][:name]).deliver
      redirect_to root_path, :notice => "Din email blev sendt, vi kontakter dig."
    else
      render :new, :error => "Din email blev ikke sendt."
    end
  end

end
