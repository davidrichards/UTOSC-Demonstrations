class CreateAgeDimension < ActiveRecord::Migration
  def self.up
    create_table :age_dimension do |t|
      t.integer value
      t.integer decade
      t.string stage
    end
  end

  def self.down
    drop_table :age_dimension
  end
end
