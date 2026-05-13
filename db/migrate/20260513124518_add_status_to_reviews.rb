class AddStatusToReviews < ActiveRecord::Migration[8.0]
  def change
    add_column :reviews, :status, :string, default: "published", null: false
    add_index :reviews, :status
  end
end
