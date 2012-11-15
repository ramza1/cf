class RenameColumnYearInRunwayYears < ActiveRecord::Migration
  def change
    rename_column :runway_years, :year, :name
    rename_column :runway_seasons, :period, :name
  end
end
