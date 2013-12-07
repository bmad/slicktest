class StepActivity < ActiveRecord::Base
  belongs_to :user
  belongs_to :step
  attr_accessible :activity_type, :description
end
