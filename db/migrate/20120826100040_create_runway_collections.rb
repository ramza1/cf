class CreateRunwayCollections < ActiveRecord::Migration
  def change
    create_table :runway_collections do |t|
      t.string :name
      t.belongs_to :year
      t.belongs_to :season

      t.timestamps
    end
    add_index :runway_collections, :year_id
    add_index :runway_collections, :season_id
  end
end
