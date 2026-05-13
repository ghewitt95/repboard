class AddCountersToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :reviews_received_count, :integer, default: 0, null: false
    add_column :users, :reviews_given_count, :integer, default: 0, null: false
    add_column :users, :links_count, :integer, default: 0, null: false
  end
end
