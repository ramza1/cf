class AddAttachmentTopBannerToTopAds < ActiveRecord::Migration
  def self.up
    change_table :top_ads do |t|
      t.has_attached_file :top_banner
    end
  end

  def self.down
    drop_attached_file :top_ads, :top_banner
  end
end
