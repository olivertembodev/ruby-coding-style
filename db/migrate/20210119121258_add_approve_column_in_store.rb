class AddApproveColumnInStore < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :approve, :boolean, default: :true
    add_column :stores, :affiliate_name, :string
    add_column :stores, :affiliate_id, :string
  end
end
