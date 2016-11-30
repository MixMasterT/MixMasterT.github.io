class Person < ActiveRecord::Base
  belongs_to :house
  
  validates :name, :address, :presence => true
end
