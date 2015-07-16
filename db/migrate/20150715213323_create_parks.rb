class CreateParks < ActiveRecord::Migration
  def self.up
    create_table :parks do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
    end
  end

  def self.down
    drop_table :parks
  end
end
