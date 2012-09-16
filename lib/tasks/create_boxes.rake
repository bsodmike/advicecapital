# encoding: utf-8
namespace :boxes do
	desc "rake task to create boxes on frontpage"
	task :create_boxes => :environment do
		boxes = {
			'Portefølje-selskab' => {
				:title => "Portefølje-selskab",
				:name => "frontpage_portfolio",
				:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
			},
			'Hvorfor valgte vi Advice Invest?' => {
				:title => "Hvorfor valgte vi Advice Invest?",
				:name => "frontpage_choose",
				:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
			},
			'Om AdviceCapital 1.' => {
				:title => "Om AdviceCapital 1.", 
				:name => "pages_about_ac_first",
				:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
			},
			'Om AdviceCapital 2.' => {
				:title => "Om AdviceCapital 2.", 
				:name => "pages_about_ac_second",
				:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
			},
			'Produkter 1.' => {
				:title => "Produkter 1.", 
				:name => "pages_products_first",
				:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
			},
			'Produkter 2.' => {
				:title => "Produkter 2.", 
				:name => "pages_products_second",
				:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
			},
			'Investeringsunivers 1.' => {
				:title => "Investeringsunivers 1.",
				:name => "pages_invest_universe_first",
				:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
			},
			'Investeringsunivers 2.' => {
				:title => "Investeringsunivers 2.", 
				:name => "pages_invest_universe_second",
				:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
			},
			'Bliv kunde 1.' => {
				:title => "Bliv kunde 1.",
				:name => "pages_become_customer_first",
				:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
			},
			'Bliv kunde 2.' => {
				:title => "Blic kunde 2.",
				:name => "pages_become_customer_second",
				:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
			}
		}

		boxes.each do |box, value|
			Box.create(:title => value[:title], :name => value[:name], :content => value[:content])
		end

	end

end