class CreateWorkClassDimension < ActiveRecord::Migration
  def self.up
    create_table :work_class_dimension do |t|
      t.string value
      t.string full
      t.string classification
    end
  end

  def self.down
    drop_table :work_class_dimension
  end
end
