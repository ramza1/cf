class CreateTrendSpottings < ActiveRecord::Migration
  def change
    create_table :trend_spottings do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
