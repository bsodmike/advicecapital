class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Du har ikke rettigheder til dette."
    redirect_to root_url
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
end
