class TestCasesController < ApplicationController

  # GET /project/:project_id/test_cases/:id
  # GET /project/:project_id/test_cases/:id.json
  def show
    @tc = TestCase.find(params[:id])
    @project = @tc.project
    @steps = @tc.steps.where("status != 'deleted'")
    @steps = [] if @steps.nil?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tc }
    end
  end

  # GET /project/:project_id/test_cases/new
  def new
    @tc = TestCase.new
    @project = Project.find(params[:project_id])

    render :layout => "empty"
  end

  # GET /project/:project_id/test_cases/:id/edit
  def edit
    @tc = TestCase.find(params[:id])
    @project = @tc.project
  end

  # POST /project/:project_id/test_case
  # POST /project/:project_id/test_case.json
  def create
    @tc = TestCase.new(params[:test_case])
    @tc.project = Project.find(params[:project_id].to_i)

    respond_to do |format|
      if @tc.save!
        format.json { render :json => @tc, :status => :created, location => @tc }
        format.html { redirect_to(project_path(@tc.project)) }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project/:project_id/test_cases/:id
  # PUT /project/:project_id/test_cases/:id.json
  def update
    @tc = TestCase.find(params[:id])

    respond_to do |format|
      if @tc.update_attributes(params[:test_case])
        format.html { redirect_to(project_test_case_path(@tc.project, @tc)) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project/:project_id/test_cases/:id
  # DELETE /project/:project_id/test_cases/:id.json
  def destroy
    @tc = TestCase.find(params[:id])
    @tc.status = "deleted"
    @tc.save!

    respond_to do |format|
      format.json { render :json => "success" }
    end
  end
end
