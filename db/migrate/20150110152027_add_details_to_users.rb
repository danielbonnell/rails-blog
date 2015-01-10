class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :website, :string
    add_column :users, :username, :string, null: false
    add_column :users, :avatar, :string
    add_column :users, :role, :integer, null: false, default: 0
  end
end
