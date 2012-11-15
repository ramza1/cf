class AddStartDateToTopAd < ActiveRecord::Migration
  def change
    add_column :top_ads, :start_date, :datetime
    add_column :top_ads, :end_date, :datetime
    add_column :right_ads, :start_date, :datetime
    add_column :right_ads, :end_date, :datetime
  end
end
