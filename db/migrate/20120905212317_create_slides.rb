class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :caption
      t.string :url

      t.timestamps
    end
  end
end
