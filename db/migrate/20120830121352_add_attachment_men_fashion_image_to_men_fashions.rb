class AddAttachmentMenFashionImageToMenFashions < ActiveRecord::Migration
  def self.up
    change_table :men_fashions do |t|
      t.has_attached_file :men_fashion_image
    end
  end

  def self.down
    drop_attached_file :men_fashions, :men_fashion_image
  end
end
