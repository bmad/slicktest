class Step < ActiveRecord::Base
  belongs_to :project
  has_many :run_cases
  attr_accessible :name, :status, :archived

end
