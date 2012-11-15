class AddAttachmentTipImageToTips < ActiveRecord::Migration
  def self.up
    change_table :tips do |t|
      t.has_attached_file :tip_image
    end
  end

  def self.down
    drop_attached_file :tips, :tip_image
  end
end
