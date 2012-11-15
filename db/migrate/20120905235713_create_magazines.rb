class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.string :title
      t.datetime :published_at
      t.text :description

      t.timestamps
    end
  end
end
