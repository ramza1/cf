class FunctionalFashionDesigner < ActiveRecord::Base
  attr_accessible :name, :icon, :description
  has_attached_file :icon, :styles => {:trend_small => "100x100>", :original => "800x800>"}
  validates_attachment_presence :icon
  validates_attachment_content_type :icon, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_presence :icon
  validates :name, :icon, :description, :presence => true
  has_many :functional_fashions
end
