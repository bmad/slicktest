class RunStepsController < ApplicationController

  # GET /runs/:run_id/run_cases/:run_case_id/run_steps/:id
  def show
    @step = RunStep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @step }
    end
  end

  # GET /runs/:run_id/run_cases/:run_case_id/run_steps/new
  # GET /runs/:run_id/run_cases/:run_case_id/run_steps/new.json
  def new
    @step = RunStep.new
    @run = Run.find(params[:run_id])
    @rc = RunCase.find(params[:run_case_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /runs/:run_id/run_cases/:run_case_id/run_steps/:id/edit
  # GET /runs/:run_id/run_cases/:run_case_id/run_steps/:id/edit.json
  def edit
    @step = RunStep.find(params[:id])
    @run = Run.find(params[:run_id])
    @rc = RunCase.find(params[:run_case_id])

    render :layout => "empty"
  end

  # PUT /runs/:run_id/run_cases/:run_case_id/run_steps/:id.json
  def update
    @step = RunStep.find(params[:id])
    @step.status = params[:status]
    @case = @step.run_case

    respond_to do |format|
      if @step.save
        @case.calculate_percents
        format.json { render :json => {:percent_completed => @case.percent_completed} }
      else
        format.json { render :json => @step.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /runs/:run_id/run_cases/:run_case_id/run_steps/:id/update_note
def update_note
      @step = RunStep.find(params[:id])
      @step.note = params['run_step']['note']

      respond_to do |format|
        if @step.save
          format.json { render :json => "success" }
        else
          format.json { render :json => @step.errors, :status => :unprocessable_entity }
        end
      end
end

  # DELETE /runs/:run_id/run_cases/:run_case_id/run_steps/:id
  # DELETE /runs/:run_id/run_cases/:run_case_id/run_steps/:id.json
  def destroy
    @step = RunStep.find(params[:id])
    @step.destroy

    respond_to do |format|
      format.json { render :json => "success" }
    end
  end
end
