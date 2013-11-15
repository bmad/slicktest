class RunCase < ActiveRecord::Base
  belongs_to :run
  has_many :run_steps
  attr_accessible :run, :name, :description
  attr_accessor :percent_completed, :percent_failed, :percent_passed

  def calculate_percents
      results = ActiveRecord::Base.connection.execute(%{
        select sum(case status when 'skip' then 0 else 1 end) as total,
        sum(case status when 'failed' then 1 else 0 end) as failed,
        sum(case status when 'pass' then 1 else 0 end) as passed
        from run_steps
        where run_case_id = #{self.id} and
        status != 'skip';
      })
      total = results[0]['total'].to_i
      passed = results[0]['passed'].to_i
      failed = results[0]['failed'].to_i
      completed = passed + failed
      self.percent_completed = if (completed.nonzero? && total.nonzero?)
                                (completed/total*100).round(0)
                             else 0
                             end
      self.percent_failed = if (failed.nonzero? && total.nonzero?)
                              (failed/total*100).round(0)
                             else 0
                             end
      self.percent_passed = if (passed.nonzero? && total.nonzero?)
                              (passed/total*100).round(0)
                             else 0
                             end
  end
end
