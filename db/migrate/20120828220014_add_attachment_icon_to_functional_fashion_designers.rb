class AddAttachmentIconToFunctionalFashionDesigners < ActiveRecord::Migration
  def self.up
    change_table :functional_fashion_designers do |t|
      t.has_attached_file :icon
    end
  end

  def self.down
    drop_attached_file :functional_fashion_designers, :icon
  end
end
