class AdvicePages < ActiveRecord::Base
    @@pages = {
    # Main pages
    'about_ac' => {
      :title => '',
      :template => '/pages/about_ac/index.haml'
    },
      'about_ac/concept' => {
        :title => 'Koncept',
        :template => '/pages/about_ac/concept.haml'
      },
      'about_ac/history' => {
        :title => 'Historie',
        :template => '/pages/about_ac/history.haml'
      },
      'about_ac/results' => {
        :title => 'Resultater',
        :template => '/pages/about_ac/results.haml'
      },
      'about_ac/strategy' => {
        :title => 'Strategi',
        :template => '/pages/about_ac/strategy.haml'
      },
      
    'about_ai' => {
      :title => '',
      :template => '/pages/about_ai/index.haml'
    },
      'about_ai/purpose' => {
        :title => 'Form&#229;l',
        :template => '/pages/about_ai/purpose.haml'
      },
      'about_ai/we_choosed_ai' => {
        :title => 'Derfor valgte vi Advice Invest',
        :template => '/pages/about_ai/we_choosed_ai.haml'
      },
      'about_ai/investment_philosophy' => {
        :title => 'Investeringsfilosofi',
        :template => '/pages/about_ai/investment_philosophy.haml'
      },


    'become_customer' => {
      :title => 'Bliv kunde',
      :template => '/pages/become_customer.haml'
    },

=begin
    '/organisation' => {
      :title => 'Organisation',
      :template => '/pages/organisation.haml'
    },
=end

      'organisation/employees' => {
        :title => 'Medarbejdere',
        :template => '/pages/organisation/employees.haml'
      },


    'investor_login' => {
      :title => 'Investor login',
      :template => '/pages/investor_login.haml'
    },
    'invest_universe' => {
      :title => 'Invest univers',
      :template => '/pages/invest_universe.haml'
    },
    'disclaimer' => {
      :title => 'Disclaimer',
      :template => '/pages/disclaimer.haml'
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
