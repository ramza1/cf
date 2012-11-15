class AddCaptionToTrendSpotting < ActiveRecord::Migration
  def change
    add_column :trend_spottings, :caption, :string
  end
end
