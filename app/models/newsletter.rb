class Newsletter < ActiveRecord::Base
  attr_accessible :body, :title
  validates :title, :body, :presence => true

  def summary
    self.body.gsub("&nbsp;", "")
  end
end
