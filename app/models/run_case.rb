class TestCase < ActiveRecord::Base
  belongs_to :run
  has_many :run_steps
  attr_accessible :name, :description

end
