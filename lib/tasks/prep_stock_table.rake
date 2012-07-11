# encoding: utf-8
namespace :stock_table do
  desc "Prep stock_data table"
  task :setup  => :environment do
    StockData.delete_all

    stock = [
      {:symbol=>"MAERSK-A.CO", :price=>"40000.00", :change=>"-340.00", :volume=>"3000"},
      {:symbol=>"MAERSK-B.CO", :price=>"35900.00", :change=>"-380.00",:volume=>"6653"},
      {:symbol=>"CARL-B.CO", :price=>"397.30", :change=>"+8.30", :volume=>"568789"},
      {:symbol=>"CHR.CO", :price=>"20.95", :change=>"0.00", :volume=>"0"},
      {:symbol=>"COLO-B.CO", :price=>"806.00", :change=>"+28.50", :volume=>"93403"},
      {:symbol=>"DANSKE.CO", :price=>"77.10", :change=>"+0.30", :volume=>"3591025"},
      {:symbol=>"DSV.CO", :price=>"107.70", :change=>"-1.00", :volume=>"895219"},
      {:symbol=>"FLS.CO", :price=>"322.80", :change=>"+5.10", :volume=>"509116"},
      {:symbol=>"GN.CO", :price=>"36.87", :change=>"+0.50", :volume=>"589297"},
      {:symbol=>"LUN.CO", :price=>"115.60", :change=>"+0.80", :volume=>"301292"},
      {:symbol=>"NKT.CO", :price=>"193.90", :change=>"-3.50", :volume=>"208805"},
      {:symbol=>"NDA-DKK.CO", :price=>"100.00", :change=>"-1.00", :volume=>"200100"},
      {:symbol=>"NOVO-B.CO", :price=>"560.50", :change=>"+7.00", :volume=>"901981"},
      {:symbol=>"NZYM-B.CO",:price=>"744.00", :change=>"-15.50", :volume=>"100456"},
      {:symbol=>"PNDORA.CO", :price=>"104.50", :change=>"-0.50", :volume=>"220223"},
      {:symbol=>"TDC.CO", :price=>"45.99", :change=>"+0.84", :volume=>"1744640"},
      {:symbol=>"TOP.CO", :price=>"839.50", :change=>"+7.50", :volume=>"53123"},
      {:symbol=>"TRYG.CO", :price=>"290.80", :change=>"+0.70", :volume=>"94504"},
      {:symbol=>"VWS.CO", :price=>"108.60", :change=>"-0.40", :volume=>"1001839"},
      {:symbol=>"WDH.CO", :price=>"424.60", :change=>"-3.80", :volume=>"262782"}
    ]
      
    stock.each do |hash|
      StockData.create(:symbol => hash[:symbol],:price => hash[:price], :change => hash[:change],:volume => hash[:volume])
    end

    # set price, change, and volume fields to 'NaN'
    StockData.all.each do |r|
      r.update_attributes(:price => "NaN", :change => "NaN", :volume => "NaN")
    end

  end
  
end