class RunStep < ActiveRecord::Base
  belongs_to :run_case
  attr_accessible :run_case, :place, :status, :note, :description

end
