class Photo < ActiveRecord::Base
  attr_accessible :caption, :photoable_id, :photoable_type, :photo
  belongs_to :photoable, :polymorphic => true
  has_attached_file :photo, :styles => {:thumb => "150x210#", :big => "190x300#", :trend_small => "470x700>", :original => "800x800>"}
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_presence :photo
  validates :caption, :presence => true
end
