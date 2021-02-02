class CreateTableStoreAndCategory < ActiveRecord::Migration[6.1]
  def change
    create_table :categories_stores, id: false do |t|
      t.belongs_to :store
      t.belongs_to :category
      t.timestamps
    end
  end
end
