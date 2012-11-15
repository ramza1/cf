class TrendSpotting < ActiveRecord::Base
  attr_accessible :description, :title, :trend_cover, :caption, :published_at
  has_many :photos, :as => :photoable
  has_attached_file :trend_cover, :styles => {:trend_small => "200x350>", :original => "800x800>"}
  validates_attachment_presence :trend_cover
  validates_attachment_content_type :trend_cover, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_presence :trend_cover
  validates :title, :description, :trend_cover, :caption, :published_at, :presence => true
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

  def published?
    published_at <= Time.zone.now
  end
  def last_published?
    self == self.class.published.last
  end
end
