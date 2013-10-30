class TestCasesController < ApplicationController
  # GET /test_cases
  def index
    @tc = TestCase.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /test_cases/1
  # GET /test_cases/1.json
  def show
    @tc = TestCase.find(params[:id])
    @project = @tc.project
    @steps = @tc.steps
    @steps = [] if @steps.nil?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tc }
    end
  end

  # GET /project/<project_id>/test_cases/new
  def new
    @tc = TestCase.new
    @project = Project.find(params[:project_id])

    render :layout => "empty"
  end

  # GET /test_cases/1/edit
  def edit
    @tc = TestCase.find(params[:id])
    @project = @tc.project
  end

  # POST /test_case
  # POST /test_case.json
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

  # PUT /test_cases/1
  # PUT /testcases/1.json
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

  # DELETE /test_cases/1
  # DELETE /test_cases/1.json
  def destroy
    @tc = TestCase.find(params[:id])
    @tc.destroy

    respond_to do |format|
      format.json { render :json => "success" }
    end
  end
end
