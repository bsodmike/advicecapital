class Pages < ActiveRecord::Base
  Pages = {
    # Main pages
    '/about_ac' => {
      :title => 'About',
      :template => '/pages/about_ac.html.haml'
    },
      '/about_ac/concept' => {
        :title => 'Koncept',
        :template => '/pages/about_ac/concept.html.haml'
      },
      '/about_ac/history' => {
        :title => 'Historie',
        :template => '/pages/about_ac/strategy.html.haml'
      },
      '/about_ac/results' => {
        :title => 'Resultater',
        :template => '/pages/about_ac/results.html.haml'
      },
      '/about_ac/strategy' => {
        :title => 'Strategi',
        :template => '/pages/about_ac/strategy.html.haml'
      },
      
    '/about_ai' => {
      :title => '',
      :template => '/pages/about_ai.html.haml'
    },
    '/become_customer' => {
      :title => 'Bliv kunde',
      :template => '/pages/become_customer.html.haml'
    },

    '/organisation' => {
      :title => 'Organisation',
      :template => '/pages/organisation.html.haml'
    },
      '/organisation/employees' => {
        :title => 'Medarbejdere',
        :template => '/pages/organisation/employees.html.haml'
      },


    '/investor_login' => {
      :title => 'Investor login',
      :template => '/pages/investor_login.html.haml'
    }
  }

  #def self.find_by_path(path)
<<<<<<< HEAD
  #  Pages[path]
=======
    #Pages[path]
>>>>>>> 01d821f2bdd9858fa4a5cad9ed4af53968cc6833
  #end

  #puts Pages.find_by_path('/about/')
  # {:title=>"About", :template=>"/pages/about/index.html.erb"}
end
