class RunCasesController < ApplicationController

  # GET /runs/:run_id/run_cases/:id
  # GET /runs/:run_id/run_cases/:id.json
  def show
    @rc = RunCase.find(params[:id])
    @rc.calculate_percents
    @run = @rc.run
    @steps = @rc.run_steps.order("id")
    @steps = [] if @steps.nil?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @rc }
    end
  end

  # GET /runs/:run_id/run_cases/new
  def new
    @rc = RunCase.new
    @run = Run.find(params[:run_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /runs/:run_id/run_cases/:id/edit
  def edit
    @rc = RunCase.find(params[:id])
    @run = @rc.project
  end

  # POST /runs/:run_id/run_case
  # POST /runs/:run_id/run_case.json
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

  # PUT /run_cases/:id
  # PUT /run_cases/:id.json
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

  # DELETE /run_cases/:id
  # DELETE /run_cases/:id.json
  def destroy
    @rc = RunCase.find(params[:id])
    @rc.destroy

    respond_to do |format|
      format.json { render :json => "success" }
    end
  end
end
