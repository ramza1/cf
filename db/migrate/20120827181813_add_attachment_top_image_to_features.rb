class AddAttachmentTopImageToFeatures < ActiveRecord::Migration
  def self.up
    change_table :features do |t|
      t.has_attached_file :top_image
    end
  end

  def self.down
    drop_attached_file :features, :top_image
  end
end
