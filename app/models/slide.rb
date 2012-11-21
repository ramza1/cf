class Slide < ActiveRecord::Base
  attr_accessible :caption, :url, :slide_image, :title, :published_at
  has_attached_file :slide_image, :styles => {:trend_small => "310x463#", :original => "800x800>"}
  validates_attachment_presence :slide_image
  validates_attachment_content_type :slide_image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_presence :slide_image
  validates :caption, :slide_image, :title, :published_at, :presence => true
  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  after_save :expire_cache
  scope :recent, order('published_at DESC')

  def expire_cache
    ActionController::Base.cache_store.delete_matched("slides")
  end
end
