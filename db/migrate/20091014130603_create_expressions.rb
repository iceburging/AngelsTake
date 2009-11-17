class CreateExpressions < ActiveRecord::Migration
  def self.up
    create_table :expressions do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :expressions
  end
end
