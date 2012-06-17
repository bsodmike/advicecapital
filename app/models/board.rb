class Board < ActiveRecord::Base
  attr_accessible :name, :title, :phone, :email, :image
end
