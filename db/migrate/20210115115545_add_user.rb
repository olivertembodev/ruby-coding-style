class AddUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :wallet_address, :string
    add_column :users, :phone, :string
    add_column :users, :ticker, :boolean
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end
