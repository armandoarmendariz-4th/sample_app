class MicropostsController < ApplicationController 
  before_filter :authenticate,    :only => [:create, :destroy]
  before_filter :authorized_candidate, :only => :destroy

  def create
    @micropost = current_candidate.microposts.build(params[:micropost])
    @error = @micropost.errors
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_back_or root_path
  end 

  private
    def authorized_candidate
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user?(@micropost.user)
    end
end
