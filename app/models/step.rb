class Step < ActiveRecord::Base
  belongs_to :test_case
  has_many :step_activities
  attr_accessible :place, :status, :description

end
