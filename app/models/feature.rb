class Feature < ActiveRecord::Base
  attr_accessible :content, :quote, :title, :feature_image, :quote_owner, :top_image, :published_at
  has_attached_file :feature_image, :styles => {:small => "292x432#", :original => "800x800>"}
  validates_attachment_presence :feature_image
  validates_attachment_content_type :feature_image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  has_attached_file :top_image, :styles => {:original => "800x800>"}
  validates_attachment_presence :top_image
  validates_attachment_content_type :top_image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates :content, :quote, :title, :feature_image, :top_image, :published_at, :presence => true
  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, order('published_at DESC')
  def to_param
    "#{id} #{title}".parameterize
  end

  def previous
    self.class.where("id < ?", id).order("id desc").first
  end

  def next
    self.class.where("id > ?", id).order("id").first
  end

  def last_published?
    self == self.class.published.last
  end

  def published?
    published_at <= Time.zone.now
  end
end
