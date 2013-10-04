class RunCasesController < ApplicationController
  # GET /run_cases
  def index
    @rc = RunCase.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /run_cases/1
  # GET /run_cases/1.json
  def show
    @rc = RunCase.find(params[:id])
    @run = @rc.run
    @steps = @rc.run_steps
    @steps = [] if @steps.nil?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @rc }
    end
  end

  # GET /runs/<run_id>/run_cases/new
  def new
    @rc = RunCase.new
    @run = Run.find(params[:run_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /run_cases/1/edit
  def edit
    @rc = RunCase.find(params[:id])
    @run = @rc.project
  end

  # POST /run_case
  # POST /run_case.json
  def create
    @rc = RunCase.new(params[:run_case])
    @rc.run = Run.find(params[:run_id].to_i)

    respond_to do |format|
      if @rc.save!
        format.json { render :json => @rc, :status => :created, location => @rc }
      else
        format.html { render :action => "new" }
        format.json { render :json => @rc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /run_cases/1
  # PUT /run_cases/1.json
  def update
    @rc = RunCase.find(params[:id])

    respond_to do |format|
      if @rc.update_attributes(params[:run_case])
        format.html { redirect_to @rc, :notice => 'Case was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @rc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /run_cases/1
  # DELETE /run_cases/1.json
  def destroy
    @rc = RunCase.find(params[:id])
    @rc.destroy

    respond_to do |format|
      format.json { render :json => "success" }
    end
  end
end
