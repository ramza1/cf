class CreateTopAds < ActiveRecord::Migration
  def change
    create_table :top_ads do |t|
      t.string :name
      t.string :url
      t.string :position

      t.timestamps
    end
  end
end
