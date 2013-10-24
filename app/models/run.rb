class Run < ActiveRecord::Base
  belongs_to :project
  has_many :run_cases
  attr_accessible :project_id, :name, :status, :archived

end
