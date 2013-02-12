class Task < ActiveRecord::Base
  belongs_to :assign_to
  attr_accessible :description, :due_date, :title
end
