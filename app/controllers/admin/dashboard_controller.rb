class Admin::DashboardController < AdminController

  def index
		authorize! :view, :dashboard

    @page_title = "Administration"
    @latest_news_written = News.last unless News.nil?
    @total_employees = Employee.count
		@video_box = Box.find_all_by_name("frontpage_video") unless Box.nil?
  end

end
