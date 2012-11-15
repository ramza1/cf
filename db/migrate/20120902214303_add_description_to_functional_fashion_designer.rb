class AddDescriptionToFunctionalFashionDesigner < ActiveRecord::Migration
  def change
    add_column :functional_fashion_designers, :description, :text
  end
end
