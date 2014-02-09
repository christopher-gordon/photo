class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
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
