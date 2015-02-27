class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    authorize User.new
  end

  def show
  end

  def new
    if current_user
      flash[:notice] = "already authenticated"
      redirect_to root_path
    else
      @user = User.new
      authorize @user
    end
  end

  def create
    if User.where(username: params[:user][:username]).first.nil?
      @user = User.new(user_params)
      authorize @user
      @user.save
      flash[:notice] = "new user created"
    else
      flash[:notice] = "user already exists"
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { redirect_to root_path }
    end
  end

  def edit

  end

  def update
    @user.update(user_params)
    @user.save
    respond_to do |format|
      format.html { redirect_to @user }
      format.json { redirect_to @user }
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { redirect_to users_path }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
  end
end
