class Runway::Collection < ActiveRecord::Base
  belongs_to :year
  belongs_to :season
  attr_accessible :name, :season_id, :year_id, :published_at, :collection_cover
  has_many :photos, :as => :photoable
  validates :year_id, :season_id, :name, :published_at, :presence => true
  has_attached_file :collection_cover, :styles => {:small => "255x290#", :trend_small => "700x490>", :original => "800x800>"}
  validates_attachment_presence :collection_cover
  validates_attachment_content_type :collection_cover, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_presence :collection_cover
  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, order('published_at DESC')
  def to_param
    "#{id} #{name}".parameterize
  end
end
