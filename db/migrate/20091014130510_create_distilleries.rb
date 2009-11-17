class CreateDistilleries < ActiveRecord::Migration
  def self.up
    create_table :distilleries do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :distilleries
  end
end
