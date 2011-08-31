namespace :pages do
  desc "Empty advice_pages table of all records"
  task :clear_table  => :environment do
    AdvicePage.delete_all
  end
  
  desc "Setup initial pages for AdviceCapital"
  task :seed_table_data  => :environment do

    pages = {
      '/about_ac' => {
        :title => "",
        :content => "<div class=\"span-20\">\r\n  <img src=\"/images/stock1.jpg\"/>\r\n  <p>But I must explain to you how all this mistaken idea of denouncing pleasure\r\n      and praising pain was born and I will give you a complete account of the\r\n      system, and expound the actual teachings of the great explorer of the truth,\r\n      the master-builder of human happiness.</p>\r\n</div>"
      },
      '/about_ac/concept' => {
        :title => 'Koncept',
        :content => ""
      },
      '/about_ac/history' => {
        :title => 'Historie',
        :content => ""
      },
      '/about_ac/results' => {
        :title => 'Resultater',
        :content => ""
      },
      '/about_ac/strategy' => {
        :title => 'Strategi',
        :content => ""
      },
      '/about_ai' => {
        :title => 'Investeringsfilosofi',
        :content => ""
      },
      '/about_ai/purpose' => {
        :title => "",
        :content => ""
      },
      '/about_ai/we_choosed_ai' => {
        :title => 'Derfor valgte vi Advice Invest',
        :content => ""
      },
      '/become_customer' => {
        :title => 'Bliv kunde',
        :content => ""
      },
      '/organisation/employees' => {
        :title => 'Medarbejdere',
        :content => ""
      },
      '/investor_login' => {
        :title => 'Investor login',
        :content => ""
      },
      '/invest_universe' => {
        :title => 'Invest univers',
        :content => ""
      },
      '/disclaimer' => {
        :title => 'Disclaimer',
        :content => ""
      }    
    }

    pages.each do |k,v|
      AdvicePage.create(:slug => k, :title => v[:title],:content => v[:content])
    end

  end
  
end