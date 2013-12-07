class RunStepActivity < ActiveRecord::Base
  belongs_to :user
  belongs_to :run_step
  attr_accessible :new_state
end
