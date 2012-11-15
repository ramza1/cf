class AddPublishedAtToTips < ActiveRecord::Migration
  def change
    add_column :tips, :published_at, :datetime
  end
end
