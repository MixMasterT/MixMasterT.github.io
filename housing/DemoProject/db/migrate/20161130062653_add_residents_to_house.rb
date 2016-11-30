class AddResidentsToHouse < ActiveRecord::Migration
  def change
    add_reference :houses, :person, index: true, foreign_key: true
  end
end
