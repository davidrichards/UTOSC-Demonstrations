class CreateIncomeFacts < ActiveRecord::Migration
  def self.up
    create_table :income_facts do |t|
      
    end
    # you should add indexes for each foreign key, but don't add
    # the foreign key itself unless you really know what you are doing.
  end

  def self.down
    drop_table :income_facts
  end
end
