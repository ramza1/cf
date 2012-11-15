class AddPublishedAtToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :published_at, :datetime
    add_column :slides, :title, :string
  end
end
