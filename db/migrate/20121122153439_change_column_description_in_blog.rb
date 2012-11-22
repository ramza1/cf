class ChangeColumnDescriptionInBlog < ActiveRecord::Migration
  def change
    change_column :blogs, :description, :text
  end
end
