class AddMinutesToLog < ActiveRecord::Migration
  def self.up
    add_column :logs, :minutes, :integer
  end

  def self.down
    remove_column :logs, :minutes
  end
end
