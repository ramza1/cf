class FunctionalFashion < ActiveRecord::Base
  attr_accessible :content, :user_id, :functional_fashion_image, :functional_fashion_designer_id, :published_at
  belongs_to :functional_fashion_designer
  has_attached_file :functional_fashion_image, :styles => {:trend_small => "280x280#", :original => "800x800>"}
  validates_attachment_presence :functional_fashion_image
  validates_attachment_content_type :functional_fashion_image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_presence :functional_fashion_image
  validates :content, :functional_fashion_designer_id, :functional_fashion_image, :published_at, :presence => true
  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, order('published_at DESC')

  def previous
    self.class.where("id < ?", id).order("id desc").first
  end

  def next
    self.class.where("id > ?", id).order("id").first
  end
end
