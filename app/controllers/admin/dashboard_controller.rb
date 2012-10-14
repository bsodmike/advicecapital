class Admin::DashboardController < AdminController

  def index
		authorize! :view, :dashboard

    @page_title = "Administration"
    @latest_news_written = News.last unless News.nil?
    @total_employees = Employee.count
  end

end
