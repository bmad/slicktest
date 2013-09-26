class Step < ActiveRecord::Base
  belongs_to :test_case
  attr_accessible :place, :status, :description

end
