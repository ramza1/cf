class AddAttachmentScreenShotToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.has_attached_file :screen_shot
    end
  end

  def self.down
    drop_attached_file :videos, :screen_shot
  end
end
