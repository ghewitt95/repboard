class EnableCitextOnUsers < ActiveRecord::Migration[8.0]
  def change
    # 1. Turn on the citext extension. Safe to run even if already enabled.
    enable_extension "citext"

    # 2. Convert email to citext. Preserve Devise's defaults.
    change_column :users, :email, :citext, default: "", null: false

    # 3. Convert slug to citext. Nullable, no default.
    change_column :users, :slug, :citext
  end
end
