# encoding: utf-8
desc "rake task to create boxes on frontpage"
task :create_boxes => :environment do
	boxes = {
		{
			:name => "Portefølje",
			:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
		},
		{
			:name => "Hvorfor valgte vi Advice Invest?",
			:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
		}
	}

	boxes.each do |box|
		Box.create(:name => boxes[:name], :content => boxes[:content])
	end

end