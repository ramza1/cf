class CreateFunctionalFashions < ActiveRecord::Migration
  def change
    create_table :functional_fashions do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
