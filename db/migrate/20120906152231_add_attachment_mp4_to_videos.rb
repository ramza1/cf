class AddAttachmentMp4ToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.has_attached_file :mp4
    end
  end

  def self.down
    drop_attached_file :videos, :mp4
  end
end
