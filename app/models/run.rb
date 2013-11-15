class Run < ActiveRecord::Base
  belongs_to :project
  has_many :run_cases
  attr_accessible :project_id, :name, :status, :archived
  attr_accessor :percent_completed, :percent_failed, :percent_passed

  def calculate_percents
      results = ActiveRecord::Base.connection.execute(%{
        select sum(case run_steps.status when 'skip' then 0 else 1 end) as total,
        sum(case run_steps.status when 'failed' then 1 else 0 end) as failed,
        sum(case run_steps.status when 'pass' then 1 else 0 end) as passed
        from run_steps
        join run_cases on run_cases.id = run_steps.run_case_id
        where run_cases.run_id = #{self.id} and
        run_steps.status != 'skip';
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



  def import_project(project)
    self.project = project
    project.test_cases.where("status != 'deleted'").each do |tc|
      run_case = RunCase.new({:run => self, :name => tc.name, :description => tc.description })
      run_case.save!
      tc.steps.where("status != 'deleted'").each do |rs|
        run_steps = RunStep.new({
          :run_case => run_case,
          :place => rs.place,
          :status => "new",
          :description => rs.description
        })
        run_steps.save!
      end
    end
  end
end
