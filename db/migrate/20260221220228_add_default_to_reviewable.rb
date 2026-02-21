class AddDefaultToReviewable < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :reviewable, false
  end
end
