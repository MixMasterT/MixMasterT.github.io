class AddResidentsToHouses < ActiveRecord::Migration
  def change
    add_reference :houses, :resident, index: true, foreign_key: true
  end
end
