class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    @message = Message.new(params[:message])
      @message.request = request
      if @message.deliver


    # if @message.valid?
    #   NotificationsMailer.new_message(@message).deliver
      redirect_to root_path, :notice => "Din email blev sendt, vi kontakter dig."
    else
      render :new, :error => "Din email blev ikke sendt."
    end
  end

end
