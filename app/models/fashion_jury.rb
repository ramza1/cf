class FashionJury < ActiveRecord::Base
  attr_accessible :comments_count, :content, :score, :fashion_jury_image, :published_at, :title
  has_attached_file :fashion_jury_image, :styles => {:small => "200x400>", :original => "800x800>"}
  validates_attachment_presence :fashion_jury_image
  validates_attachment_content_type :fashion_jury_image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates :title, :content, :score, :fashion_jury_image, :published_at, :presence => true
  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, order('published_at DESC')

  def to_param
    "#{id} #{title}".parameterize
  end
end
