class AddTimeToReadOnBlog < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :time_to_read, :float
  end
end
