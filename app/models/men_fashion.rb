class MenFashion < ActiveRecord::Base
  attr_accessible :content, :title, :men_fashion_image, :published_at
  has_attached_file :men_fashion_image, :styles => {:trend_small => "200x350>", :original => "800x800>"}
  validates_attachment_presence :men_fashion_image
  validates_attachment_content_type :men_fashion_image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_presence :men_fashion_image
  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, order('published_at DESC')
  validates :content, :title, :men_fashion_image, :published_at, :presence => true
  has_many :photos, :as => :photoable
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
