class StepsController < ApplicationController

  # GET /projects/<project_id>/test_cases/<test_case_id>/steps/<step_id>
  def show
    @step = Step.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @step }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @step = Step.new
    @project = Project.find(params[:project_id])
    @tc = TestCase.find(params[:test_case_id])

    render :layout => "empty"
  end

  # GET /projects/<project_id>/test_cases/<test_case_id>/steps/<step_id>/edit
  def edit
    @step = Step.find(params[:id])
    @tc = TestCase.find(params[:test_case_id])
    @project = Project.find(params[:project_id])
  end

  # POST /projects
  # POST /prjects.json
  def create
    @step = Step.new(params[:step])
    @step.test_case_id = params[:test_case_id].to_i

    respond_to do |format|
      if @step.save
        format.json { render :json => @step, :status => :created, :location => @step }
        format.html { redirect_to(project_test_case_path(@step.test_case.project, @step.test_case)) }
      else
        format.html { render :action => "new" }
        format.json { render :json => @step.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @step = Step.find(params[:id])

    respond_to do |format|
      if @step.update_attributes(params[:step])
        format.html { redirect_to(project_test_case_path(@step.test_case.project, @step.test_case)) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @step.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @step = Step.find(params[:id])
    @step.destroy

    respond_to do |format|
      format.json { render :json => "success" }
    end
  end
end
