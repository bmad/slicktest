class RunsController < ApplicationController
  # GET /runs
  def index
    @run = Run.new
    @runs = Run.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
    @run = Run.find(params[:id])
    @rcs = @run.run_cases.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @run }
    end
  end

  # GET /run/new
  # GET /runs/new.json
  def new
    @run = Run.new
    @projects = Project.all

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /runs/1/edit
  def edit
    @run = Run.find(params[:id])
    @projects = Project.all
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = Run.new(params[:run])
    @project = Project.find(params[:run][:project_id])
    @run.project = @project
    @project.test_cases.each do |tc|
      run_case = RunCase.new({:run => @run, :name => tc.name, :description => tc.description })
      run_case.save!
      tc.steps.each do |rs|
        run_steps = RunStep.new({:run_case => run_case, :place => rs.place, :status => "new", :description => rs.description })
        run_steps.save!
      end
    end

    respond_to do |format|
      if @run.save
        format.json { render :json => @run, :status => :created, :location => @run }
        format.html
      else
        format.html { render :action => "new" }
        format.json { render :json => @run.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /runs/1
  # PUT /runs/1.json
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

  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
    @run = Run.find(params[:id])
    @run.destroy

    respond_to do |format|
      format.json { render :json => "success" }
    end
  end
end
