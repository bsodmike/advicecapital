# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Employee.create([
    {
      :name => 'Lars Fetterlein',
      :title => 'Managing Partner',
      :email => 'lf@advicecapital.dk',
      :phone => '+45 2216 4081',
      :image => 'lars_fetterlein.jpg'
    },
    {
      :name => 'Tobias Hvilsted',
      :title => 'IT & Administration',
      :email => 'th@advicecapital.dk',
      :phone => '+45 4224 6134',
      :image => 'tobias_hvilsted.jpg'
    },
    {
      :name => 'Linda Kops',
      :title => 'Sekret&aelig;r',
      :email => 'lk@advicecapital.dk',
      :phone => '+45 3930 6080',
      :image => 'lind_kops.jpg'
    },
    {
      :name => 'Anette Vinum',
      :title => 'Receptionist',
      :email => 'info@advicecapital.dk',
      :phone => '+45 3930 6080',
      :image => 'anette.jpg'
    },
    {
      :name => 'Frederik Foged Dreyer-Nielsen',
      :title => 'Bestyrelsesmedlem i Advice Invest',
      :email => 'ffdn@advicecapital.dk',
      :phone => '+45 2618 9817',
      :image => 'frederik.jpg'
    },
    {
      :name => 'Jesper Thaning',
      :title => 'Bestyrelsesmedlem i Advice Invest',
      :email => 'jh@advicecapital.dk',
      :phone => '+45 4013 7654',
      :image => 'jesper_thaning.jpg'
    }
])


n = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'

for news in [1..10]
  puts news
end

News.create([
    { :content => n },
    { :content => n },
    { :content => n },
    { :content => n },
    { :content => n },
    { :content => n },
])
