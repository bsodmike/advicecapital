class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Du har ikke rettigheder til dette."
    redirect_to root_url

		Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
	end
  
  #before_filter :set_locale

	def after_sign_in_path_for(resource)
		if current_user.investor?
			admin_investor_path(current_user.investor_id)
		elsif current_user.admin?
			admin_root_path
		end
	end

	#def default_url_options(options={})
   # logger.debug "default_url_options is passed options: #{options.inspect}\n"
   # { :locale => I18n.locale }
	#end
  
	private
	def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

end
