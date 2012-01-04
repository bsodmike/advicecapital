# encoding: utf-8
namespace :pages do
  desc "Empty advice_pages table of all records"
  task :clear_table  => :environment do
    AdvicePage.delete_all
  end
  
  desc "Setup initial pages for AdviceCapital"
  task :seed_table_data  => :environment do

    pages = {
      '/about_ac' => {
        :title => "Advice Capital",
        :content => "But I must explain to you how all this mistaken idea of denouncing pleasure\r\n      and praising pain was born and I will give you a complete account of the\r\n      system, and expound the actual teachings of the great explorer of the truth,\r\n      the master-builder of human happiness."
      },
      '/about_ac/concept' => {
        :title => 'Koncept',
        :content => "Hos Advice Capital A/S fokuserer vi på, at kundernes formue vokser og forrentes forsvarligt.\r\n   Vi skal levere økonomisk fremgang og tryghed for, at næste generation er sikret. Vort forretningskoncept er at kunne tilbyde vore kunder et valg mellem ydelser, alt efter hvilken grad af involvering de selv ønsker at have. Vor portefølje strækker sig således fra traditionel investeringsrådgivning til vort investeringsselskab, hvor vi selv investerer på lige fod med andre investorer.\r\n Fælles for vore ydelser er, at vi ikke har forkærlighed for én bestemt aktivklasse.\r\n Vor succes er bygget på en fleksibilitet til at bevæge sig mellem aktier, obligationer, virksomhedsobligationer og valuta. \r\n"
      },
      '/about_ac/history' => {
        :title => 'Historie',
        :content => "Selskabet er etableret i 2009 af Lars Fetterlein, som har mere end 20 års investeringserfaring fra såvel Danmark som internationalt. Lars Fetterleins brede baggrund spænder fra en stilling som Group Treasurer hos medicinalselskabet H. Lundbeck A/S til corporate og private banking poster hos SEB Bank i London og Carnegie Bank i København, hertil kommer en position som CFO i formueforvaltningsselskabet Hvista ApS. Grundlaget for etableringen af Advice Capital er et udtalt behov hos kunder for: \r\nUafhængig rådgivning, som ikke influeres af kurtage betalinger, men som honoreres i.f.t. afkast på investeringen. \r\nInteressesammefald mellem kunden og rådgiver \r\nTæt og kontinuerlig relation mellem kunde og en let tilgængelig rådgiver \r\nEnkel og transparant prisstruktur, hvor aflønning er relateret til afkastet på den investerede formue"
      },
      '/about_ac/strategy' => {
        :title => 'Strategi',
        :content => ""
      },
      '/about_ai' => {
        :title => 'Advice Invest A/S',
        :content => "see /about_ai/index.haml TBD"
      },
      '/about_ai/company_bonds' => {
        :title => 'Advice Capital - Virksomhedsobligationer A/S',
        :content => "TBD"
      },
      '/organisation/employees' => {
        :title => 'Medarbejdere',
        :content => "TBD"
      },
      '/organisation/structure' => {
        :title => 'Organisationsstruktur',
        :content => "TBD"
      }
      '/become_customer' => {
        :title => 'Bliv kunde',
        :content => "see become_customer.haml TBD"
      },
      '/invest_universe' => {
        :title => 'Investeringsunivers',
        :content => "TBD"
      },
      '/invest_universe/stocks' => {
        :title => 'Aktier',
        :content => "TBD"
      },
      '/invest_universe/bonds' => {
        :title => 'Obligationer',
        :content => "TBD"
      },
      '/invest_universe/company_bonds' => {
        :title => 'Virksomhedsobligationer',
        :content => "TBD"
      },
      '/invest_universe/valuta' => {
        :title => 'Valuta',
        :content => "TBD"
      },
      '/investor_login' => {
        :title => 'Investor login',
        :content => "see investor_login.haml TBD"
      },
      '/disclaimer' => {
        :title => 'Disclaimer',
        :content => "see disclaimer.haml TBD"
      }    
    }

    pages.each do |k,v|
      AdvicePage.create(:slug => k, :title => v[:title],:content => v[:content])
    end

  end
  
end