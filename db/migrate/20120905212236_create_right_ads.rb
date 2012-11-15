class CreateRightAds < ActiveRecord::Migration
  def change
    create_table :right_ads do |t|
      t.string :name
      t.string :url
      t.string :position

      t.timestamps
    end
  end
end
