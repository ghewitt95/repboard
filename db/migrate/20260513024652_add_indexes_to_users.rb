class AddIndexesToUsers < ActiveRecord::Migration[8.0]
  def change
    # Unique index on slug. Backs the model validation at the DB level.
    # Postgres treats NULLs as distinct by default, so allow_nil: true is preserved.
    add_index :users, :slug, unique: true

    # Non-unique index on display_name. Speeds up sorts and search queries.
    add_index :users, :display_name
  end
end
