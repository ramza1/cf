class AddAttachmentTrendCoverToTrendSpottings < ActiveRecord::Migration
  def self.up
    change_table :trend_spottings do |t|
      t.has_attached_file :trend_cover
    end
  end

  def self.down
    drop_attached_file :trend_spottings, :trend_cover
  end
end
