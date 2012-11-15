class AddAttachmentBlogImageToBlogs < ActiveRecord::Migration
  def self.up
    change_table :blogs do |t|
      t.has_attached_file :blog_image
    end
  end

  def self.down
    drop_attached_file :blogs, :blog_image
  end
end
