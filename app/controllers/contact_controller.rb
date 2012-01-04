class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  # def create
  #   @message = Message.new(params[:message])
  #    if @message.valid?
  #     Contact.contact(@message).deliver
  #     redirect_to root_path, :notice => "Din email blev sendt, vi kontakter dig."
  #   else
  #     render :new, :error => "Din email blev ikke sendt."
  #   end
  # end

  def create
    if Contact.contact(params[:message][:message], params[:message][:email]).deliver
      redirect_to root_path, :notice => "Din email blev sendt, vi kontakter dig."
    else
      render :new, :error => "Din email blev ikke sendt."
    end
  end

end
