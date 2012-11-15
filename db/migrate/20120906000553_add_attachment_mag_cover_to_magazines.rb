class AddAttachmentMagCoverToMagazines < ActiveRecord::Migration
  def self.up
    change_table :magazines do |t|
      t.has_attached_file :mag_cover
    end
  end

  def self.down
    drop_attached_file :magazines, :mag_cover
  end
end
