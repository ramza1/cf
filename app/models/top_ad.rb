class TopAd < ActiveRecord::Base
  attr_accessible :name, :position, :url, :top_banner, :start_date, :end_date
  validates :name, :url, :top_banner, :presence => true

  has_attached_file :top_banner, :styles => {:trend_small => "930x90#", :original => "800x800>"}
  validates_attachment_presence :top_banner
  validates_attachment_content_type :top_banner, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_presence :top_banner

  scope :running_ads, lambda { where('end_date > ? AND start_date <= ?', Time.now.utc, Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }

  def out_of_date?
      end_date <= Time.zone.now
  end
end


