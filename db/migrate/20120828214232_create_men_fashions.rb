class CreateMenFashions < ActiveRecord::Migration
  def change
    create_table :men_fashions do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
