class RunCase < ActiveRecord::Base
  belongs_to :run
  has_many :run_steps
  attr_accessible :run, :name, :description

end
