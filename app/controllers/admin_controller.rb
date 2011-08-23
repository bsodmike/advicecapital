class AdminController < ApplicationController
  before_filter :signed_in_user, :only => [:index]

  def index
    @page_title = "Admin"
    @latest_news_written = News.last
    @total_employees = Employee.count
  end
end
