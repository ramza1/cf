class CreateRunwayYears < ActiveRecord::Migration
  def change
    create_table :runway_years do |t|
      t.string :year

      t.timestamps
    end
  end
end
