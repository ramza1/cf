class CreateFunctionalFashionDesigners < ActiveRecord::Migration
  def change
    create_table :functional_fashion_designers do |t|
      t.string :name

      t.timestamps
    end
  end
end
