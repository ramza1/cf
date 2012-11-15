class Video < ActiveRecord::Base
  attr_accessible :description, :title, :published_at, :mp4, :screen_shot, :youtube_video_id
  has_attached_file :mp4
  validates_attachment_presence :mp4, if: :no_youtube?
  validates_attachment_content_type :mp4, :content_type => ['video/mp4']
  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, order('published_at DESC')

  has_attached_file :screen_shot, :styles => {:thumb => "130x90#", :large => "290x215#", :trend_small => "700x490>", :original => "800x800>"}
  validates_attachment_presence :screen_shot, :if => :no_youtube?
  validates_attachment_content_type :screen_shot, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates :title, :published_at, :description, :presence => true

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

  def no_youtube?
    youtube_video_id.nil?
  end

end
