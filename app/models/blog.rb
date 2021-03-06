class Blog < ActiveRecord::Base
  attr_accessible :content, :title, :blog_image, :published_at, :tag_list, :description
  has_attached_file :blog_image, :styles => {:trend_small => "700x490>", :original => "800x800>"}
  validates_attachment_presence :blog_image
  validates_attachment_content_type :blog_image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_presence :blog_image
  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, order('published_at DESC')
  validates :content, :title, :published_at, :description, :presence => true
  before_validation :sanitize_data
  before_save :sanitize_data

  acts_as_taggable

  def self.search_published(query, tag_id = nil)
      published.primitive_search(query)
  end

  def self.primitive_search(query, join = "AND")
    find(:all, :conditions => primitive_search_conditions(query, join))
  end

  def similar_stories
    self.class.published.limit(3).primitive_search(title, "OR")
  end

  def next_story
    self.class.find(:first,
                    :conditions => ['id > ?', self.id],
                    :order => 'id')
  end

  def previouss
    self.class.find(:first,
                    :conditions => ['id < ?', self.id],
                    :order => 'id desc')
  end

  def previous
    self.class.where("id < ?", id).order("id desc").first
  end

  def next
    self.class.where("id > ?", id).order("id").first
  end

  def to_param
    "#{id}-#{title.parameterize}"
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

  def summary
    self.description.gsub("&nbsp;", "")
  end


  def sanitize_data
    self.description = content.gsub(/<\/?[^>]*>/, "").squeeze(" ").strip[0..200]
  end

  private

  def self.primitive_search_conditions(query, join)
    query.split(/\s+/).map do |word|
      '(' + %w[title].map { |col| "#{col} LIKE #{sanitize('%' + word.to_s + '%')}" }.join(' OR ') + ')'
    end.join(" #{join} ")
  end
end
