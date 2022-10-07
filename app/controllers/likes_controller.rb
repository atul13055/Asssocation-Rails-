class LikesController < ApplicationController
   #before_action :find_post
  def create
    #debugger
    if already_liked?
       flash[:notice] = "You can't like more than once"
    else
      @post= Post.find(params[:post_id])
      @like= @post.likes.create(user_id: current_user.id)
    #@post.likes.create(user_id: current_user.id)
  end
    redirect_to root_path
  end

  def destroy
    
    if !(already_liked?)
    flash[:notice] = "Cannot unlike"
  else
    #debugger
      @post= Post.find(params[:post_id])
      @like= @post.likes.find_by(user_id: current_user.id)
      @like.destroy
  end
    redirect_to root_path
     
  end

  private
    def already_liked?
     Like.where(user_id: current_user.id, post_id:params[:post_id]).exists?
   
  end
end


 
