class AddAttachmentFashionJuryImageToFashionJuries < ActiveRecord::Migration
  def self.up
    change_table :fashion_juries do |t|
      t.has_attached_file :fashion_jury_image
    end
  end

  def self.down
    drop_attached_file :fashion_juries, :fashion_jury_image
  end
end
