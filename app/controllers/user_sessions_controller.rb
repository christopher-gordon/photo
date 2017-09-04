class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email].downcase, params[:password])
      redirect_back_or_to(:admin_index, :notice => 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render :action => 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, :notice => 'Logged out!')
  end
end
