class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.string :name
      t.string :day_list
      t.string :direction
      t.integer :mode_id
      t.integer :region_id

      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
