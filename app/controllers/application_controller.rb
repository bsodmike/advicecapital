class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Du har ikke rettigheder til dette."
    redirect_to root_url
  end
  
  before_filter :set_locale

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
	end
  
	private
	def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

end
