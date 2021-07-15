class AddScannedCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :scanned_count, :integer, default: 0
  end
end
