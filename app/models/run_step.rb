class RunStep < ActiveRecord::Base
  belongs_to :run_case
  attr_accessible :place, :status, :description

end
