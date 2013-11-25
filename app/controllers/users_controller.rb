class UsersController < ApplicationController

  # GET /users
  def index
    @user = User.new
    @users = User.where("status != 'deleted'")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/:id
  # GET /users/:id.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    render :layout => "empty"
  end

  # GET /users/:id/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.status = 'active'

    respond_to do |format|
      if @user.save
        format.json { render :json => @user, :status => :created }
        format.html { redirect_to(users_path) }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/:id
  # PUT /users/:id.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to edit_user_path(@user), :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/:id
  # DELETE /users/:id.json
  def destroy
    @user = User.find(params[:id])
    @user.status = 'deleted'
    @user.save!

    respond_to do |format|
      format.json { render :json => "success" }
    end
  end
end
