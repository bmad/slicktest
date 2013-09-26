class TestCase < ActiveRecord::Base
  belongs_to :project
  has_many :steps
  attr_accessible :name, :description

end
