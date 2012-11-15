class AddTitleToFashionJury < ActiveRecord::Migration
  def change
    add_column :fashion_juries, :title, :string
  end
end
