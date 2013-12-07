class RunStepActivitiesController < ApplicationController
  # GET /run_step_activities
  # GET /run_step_activities.json
  def index
    @run_step_activities = RunStepActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @run_step_activities }
    end
  end

  # GET /run_step_activities/1
  # GET /run_step_activities/1.json
  def show
    @run_step_activity = RunStepActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @run_step_activity }
    end
  end

  # GET /run_step_activities/new
  # GET /run_step_activities/new.json
  def new
    @run_step_activity = RunStepActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @run_step_activity }
    end
  end

  # GET /run_step_activities/1/edit
  def edit
    @run_step_activity = RunStepActivity.find(params[:id])
  end

  # POST /run_step_activities
  # POST /run_step_activities.json
  def create
    @run_step_activity = RunStepActivity.new(params[:run_step_activity])

    respond_to do |format|
      if @run_step_activity.save
        format.html { redirect_to @run_step_activity, notice: 'Run step activity was successfully created.' }
        format.json { render json: @run_step_activity, status: :created, location: @run_step_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @run_step_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /run_step_activities/1
  # PUT /run_step_activities/1.json
  def update
    @run_step_activity = RunStepActivity.find(params[:id])

    respond_to do |format|
      if @run_step_activity.update_attributes(params[:run_step_activity])
        format.html { redirect_to @run_step_activity, notice: 'Run step activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @run_step_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /run_step_activities/1
  # DELETE /run_step_activities/1.json
  def destroy
    @run_step_activity = RunStepActivity.find(params[:id])
    @run_step_activity.destroy

    respond_to do |format|
      format.html { redirect_to run_step_activities_url }
      format.json { head :no_content }
    end
  end
end
