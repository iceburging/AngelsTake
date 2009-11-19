class AddExpressionIdToScore < ActiveRecord::Migration
  def self.up
    add_column  :scores, :expression_id, :integer
  end

  def self.down
    remove_column :scores, :expression_id
  end
end

