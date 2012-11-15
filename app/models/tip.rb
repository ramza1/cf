class Tip < ActiveRecord::Base
  attr_accessible :body, :title, :published_at, :tip_image
  has_attached_file :tip_image, :styles => {:trend_small => "700x490>", :original => "800x800>"}
  validates_attachment_presence :tip_image
  validates_attachment_content_type :tip_image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, order('published_at DESC')
  validates :body, :title, :published_at, :tip_image, :presence => true

  def previous
    self.class.where("id < ?", id).order("id desc").first
  end

  def next
    self.class.where("id > ?", id).order("id").first
  end

  def to_param
    "#{id} #{title}".parameterize
  end

  def last_published?
    self == self.class.published.last
  end

  def first_published?
    self == self.class.published.first
  end

  def published?
    published_at <= Time.zone.now
  end

end
