class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs, :force => true do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
