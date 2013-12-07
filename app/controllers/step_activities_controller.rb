class StepActivitiesController < ApplicationController
  # GET /step_activities
  # GET /step_activities.json
  def index
    @step_activities = StepActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @step_activities }
    end
  end

  # GET /step_activities/1
  # GET /step_activities/1.json
  def show
    @step_activity = StepActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @step_activity }
    end
  end

  # GET /step_activities/new
  # GET /step_activities/new.json
  def new
    @step_activity = StepActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @step_activity }
    end
  end

  # GET /step_activities/1/edit
  def edit
    @step_activity = StepActivity.find(params[:id])
  end

  # POST /step_activities
  # POST /step_activities.json
  def create
    @step_activity = StepActivity.new(params[:step_activity])

    respond_to do |format|
      if @step_activity.save
        format.html { redirect_to @step_activity, notice: 'Step activity was successfully created.' }
        format.json { render json: @step_activity, status: :created, location: @step_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @step_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /step_activities/1
  # PUT /step_activities/1.json
  def update
    @step_activity = StepActivity.find(params[:id])

    respond_to do |format|
      if @step_activity.update_attributes(params[:step_activity])
        format.html { redirect_to @step_activity, notice: 'Step activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @step_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /step_activities/1
  # DELETE /step_activities/1.json
  def destroy
    @step_activity = StepActivity.find(params[:id])
    @step_activity.destroy

    respond_to do |format|
      format.html { redirect_to step_activities_url }
      format.json { head :no_content }
    end
  end
end
