class AdvicePages < ActiveRecord::Base
    @@pages = {
    # Main pages
    '/about_ac' => {
      :title => '',
      :template => '/pages/about_ac/index.haml'
    },
      '/about_ac/concept' => {
        :title => 'Koncept',
        :template => '/pages/about_ac/concept.haml'
      },
      '/about_ac/history' => {
        :title => 'Historie',
        :template => '/pages/about_ac/history.haml'
      },
      '/about_ac/results' => {
        :title => 'Resultater',
        :template => '/pages/about_ac/results.haml'
      },
      '/about_ac/strategy' => {
        :title => 'Strategi',
        :template => '/pages/about_ac/strategy.haml'
      },
      
    '/about_ai' => {
      :title => '',
      :template => '/pages/about_ai/index.haml'
    },
      '/about_ai/purpose' => {
        :title => 'Form&aring;l',
        :template => '/pages/about_ai/purpose.haml'
      },
      '/about_ai/we_choosed_ai' => {
        :title => 'Derfor valgte vi Advice Invest',
        :template => '/pages/about_ai/we_choosed_ai.haml'
      },


    '/become_customer' => {
      :title => 'Bliv kunde',
      :template => '/pages/become_customer.haml'
    },

    '/organisation' => {
      :title => 'Organisation',
      :template => '/pages/organisation.haml'
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

  def self.find_by_path(path)
    @@pages[path]
    #Pages[path]
  end
  
  def self.get_pages
    @@pages
  end
end
