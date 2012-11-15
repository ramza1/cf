class AddPublishedAtToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :published_at, :datetime
    add_column :fashion_juries, :published_at, :datetime
    add_column :features, :published_at, :datetime
    add_column :functional_fashions, :published_at, :datetime
    add_column :look_books, :published_at, :datetime
    add_column :men_fashions, :published_at, :datetime
    add_column :redcarpets, :published_at, :datetime
    add_column :runway_collections, :published_at, :datetime
    add_column :trend_spottings, :published_at, :datetime
  end
end
