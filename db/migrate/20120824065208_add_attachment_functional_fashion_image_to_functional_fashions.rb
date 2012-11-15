class AddAttachmentFunctionalFashionImageToFunctionalFashions < ActiveRecord::Migration
  def self.up
    change_table :functional_fashions do |t|
      t.has_attached_file :functional_fashion_image
    end
  end

  def self.down
    drop_attached_file :functional_fashions, :functional_fashion_image
  end
end
