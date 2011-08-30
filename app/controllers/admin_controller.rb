class AdminController < ApplicationController
  respond_to :html, :json, :xml
  before_filter :signed_in_user, :only => [:index]
  #before_filter :super_admin, :only => [:edit, :update]

  def index
    @page_title = "Admin"
    @latest_news_written = News.last
    @total_employees = Employee.count
  end

end
