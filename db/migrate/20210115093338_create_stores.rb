class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :reward
      t.string :url
      t.timestamps
    end
  end
end
