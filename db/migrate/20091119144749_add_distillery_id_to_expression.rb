class AddDistilleryIdToExpression < ActiveRecord::Migration
  def self.up
    add_column :expressions, :distillery_id, :integer
  end

  def self.down
    remove_column :expressions, :distillery_id
  end
end

