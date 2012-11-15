class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :title
      t.text :content
      t.string :quote
      t.integer :user_id

      t.timestamps
    end
  end
end
