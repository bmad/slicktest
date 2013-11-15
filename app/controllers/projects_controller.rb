class ProjectsController < ApplicationController
  # GET /projects
  def index
    @project = Project.new
    @projects = Project.where("status != 'deleted'")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @projects }
    end
  end

  # GET /projects/:id
  # GET /projects/:id.json
  def show
    @project = Project.find(params[:id])
    @tcs = @project.test_cases.where("status != 'deleted'")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    render :layout => "empty"
  end

  # GET /projects/:id/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /prjects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.json { render :json => @project, :status => :created, :location => @project }
        format.html { redirect_to(projects_path) }
      else
        format.html { render :action => "new" }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/:id
  # PUT /projects/:id.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, :notice => 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/:id
  # DELETE /projects/:id.json
  def destroy
    @project = Project.find(params[:id])
    @project.status = 'deleted'
    @project.save!

    respond_to do |format|
      format.json { render :json => "success" }
    end
  end
end
