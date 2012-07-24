class MicropostsController < ApplicationController
  before_filter :signed_in_user 
  before_filter :correct_user,   only: :destroy

  def index
    if signed_in?
    redirect_to root_path
    end
  end

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_path
  end



  private

   def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end


 # or
# @micropost = Micropost.find_by_id(params[:id])
#redirect_to root_path unless current_user?(@micropost.user)
#or same logic

#  def correct_user
#  @micropost = current_user.microposts.find(params[:id])
#  rescue
#  redirect_to root_path
#  end
end
