class AddLogsCountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :logs_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :logs_count
  end
end
