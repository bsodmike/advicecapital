# encoding: utf-8
namespace :boxes do
	desc "rake task to create boxes on frontpage"
	task :create_boxes => :environment do
		boxes = {
			'Portefølje-selskab' => {
				:name => "Portefølje-selskab",
				:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
			},
			'Hvorfor valgte vi Advice Invest?' => {
				:name => "Hvorfor valgte vi Advice Invest?",
				:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
			}
		}

		boxes.each do |box, value|
			Box.create(:name => value[:name], :content => value[:content])
		end

	end

end