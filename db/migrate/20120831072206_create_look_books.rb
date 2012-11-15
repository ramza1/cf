class CreateLookBooks < ActiveRecord::Migration
  def change
    create_table :look_books do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
