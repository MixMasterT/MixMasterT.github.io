class House < ActiveRecord::Base
  validates :address, :presence => true, :uniqueness => true

  has_many :residents,
            :class_name => "Resident",
            :foreign_key => :person_id,
            :primary_key => :id
end
