class AddFunctionalFashionDesignerToFunctionalFashion < ActiveRecord::Migration
  def change
    add_column :functional_fashions, :functional_fashion_designer_id, :integer
  end
end
