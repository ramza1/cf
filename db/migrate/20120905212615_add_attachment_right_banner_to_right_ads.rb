class AddAttachmentRightBannerToRightAds < ActiveRecord::Migration
  def self.up
    change_table :right_ads do |t|
      t.has_attached_file :right_banner
    end
  end

  def self.down
    drop_attached_file :right_ads, :right_banner
  end
end
