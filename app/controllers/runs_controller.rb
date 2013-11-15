class RunsController < ApplicationController
  # GET /runs
  def index
    @run = Run.new
    @runs = Run.where("status != 'deleted'")
    @runs.each { |r| r.calculate_percents }

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /runs/:id
  # GET /runs/:id.json
  def show
    @run = Run.find(params[:id])
    @run.calculate_percents
    @rcs = @run.run_cases.all
    @rcs.each { |r| r.calculate_percents }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @run }
    end
  end

  # GET /run/new
  # GET /runs/new.json
  def new
    @run = Run.new
    @projects = Project.where("status != 'deleted'")

    render :layout => "empty"
  end

  # GET /runs/:id/edit
  def edit
    @run = Run.find(params[:id])
    @projects = Project.where("status != 'deleted'")
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = Run.new(params[:run])
    @project = Project.find(params[:run][:project_id])
    @run.import_project(@project)

    respond_to do |format|
      if @run.save
        format.json { render :json => @run, :status => :created, :location => @run }
        format.html { redirect_to(runs_path) }
      else
        format.html { render :action => "new" }
        format.json { render :json => @run.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /runs/:id
  # PUT /runs/:id.json
  def update
    @run = Run.find(params[:id])

    respond_to do |format|
      if @run.update_attributes(params[:run])
        format.html { redirect_to @run, :notice => 'Run was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @run.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /runs/:id
  # DELETE /runs/:id.json
  def destroy
    @run = Run.find(params[:id])
    @run.status = "deleted"
    @run.save!

    respond_to do |format|
      format.json { render :json => "success" }
    end
  end
end
