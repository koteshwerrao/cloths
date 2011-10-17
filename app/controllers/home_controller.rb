class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index

  def index
  end

  def token
  end
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html {  }
      format.xml { head :ok }
    end
  end
  def update
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to(root_path) }
      format.xml { head :ok }
    end
  end
end
