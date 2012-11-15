class AddAttachmentCollectionCoverToRunwayCollections < ActiveRecord::Migration
  def self.up
    change_table :runway_collections do |t|
      t.has_attached_file :collection_cover
    end
  end

  def self.down
    drop_attached_file :runway_collections, :collection_cover
  end
end
