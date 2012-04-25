class PagesController < ApplicationController
  def home
    @title = "Home"
    @micropost = Micropost.new if signed_in?
    @error = current_user.errors if signed_in?
    @feed_items = current_user.feed.paginate(:page => params[:page]) if signed_in?
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
end
