class LookBook < ActiveRecord::Base
  attr_accessible :description, :name, :published_at
  has_many :photos, :as => :photoable
  validates :description, :name, :published_at, :presence => true

  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, order('published_at DESC')

  def previous
    self.class.where("id < ?", id).order("id desc").first
  end

  def next
    self.class.where("id > ?", id).order("id").first
  end

  def to_param
    "#{id} #{name}".parameterize
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
