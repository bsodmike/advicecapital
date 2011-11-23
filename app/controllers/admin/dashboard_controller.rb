class Admin::DashboardController < AdminController

  def index
		authorize! :view, Admin::Dashboard

    @page_title = "Administration"
    @latest_news_written = News.last
    @total_employees = Employee.count
  end

end
