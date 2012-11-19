class Magazine < ActiveRecord::Base
  attr_accessible :description, :published_at, :title, :mag_cover
  has_attached_file :mag_cover, :styles => {:trend_small => "424x600#", :original => "800x800>"}
  validates_attachment_presence :mag_cover
  validates_attachment_content_type :mag_cover, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_presence :mag_cover
  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :recent, order('published_at DESC')
  validates :description, :published_at, :title, :mag_cover, :presence => true

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
