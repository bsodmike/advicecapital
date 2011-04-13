class Pages < ActiveRecord::Base
  Pages = {
    '/about/' => {
      :title => 'About',
      :template => '/pages/about/index.html.erb'
    }
  }

  def self.find_by_path(path)
    Pages[path]
  end

  puts Page.find_by_path('/about/')
  # {:title=>"About", :template=>"/pages/about/index.html.erb"}
end
