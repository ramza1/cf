class CreateRunwaySeasons < ActiveRecord::Migration
  def change
    create_table :runway_seasons do |t|
      t.string :period

      t.timestamps
    end
  end
end
