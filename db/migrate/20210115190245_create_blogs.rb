class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.belongs_to :user

      t.timestamps
    end
  end
end
