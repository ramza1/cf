class AddAttachmentFeatureImageToFeatures < ActiveRecord::Migration
  def self.up
    change_table :features do |t|
      t.has_attached_file :feature_image
    end
  end

  def self.down
    drop_attached_file :features, :feature_image
  end
end
