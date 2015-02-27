class SessionsController < ApplicationController
  def new
    if current_user
      flash[:notice] = "already authenticated"
      redirect_to root_path
    end
  end

  def create
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "authenticated"
    else
      flash[:notice] = "could not authenticate"
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { redirect_to root_path }
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "unauthenticated"

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { redirect_to root_path }
    end
  end
end
