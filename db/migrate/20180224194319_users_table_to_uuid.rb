class UsersTableToUuid < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :uuid, :uuid, default: "gen_random_uuid()", null: false

    remove_column :users, :id
    rename_column :users, :uuid, :id

    execute "ALTER TABLE users ADD PRIMARY KEY (id);"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
