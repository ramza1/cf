class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :caption
      t.string :photoable_type, :default => "",    :null => false
      t.integer :photoable_id,                      :null => false

      t.timestamps
    end
    add_index "photos", ["photoable_id", 'photoable_type']
  end
end
