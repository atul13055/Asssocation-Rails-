class CommentsController < ApplicationController
  def index
    #debugger
     #@comments=Comment.all
     @comments = Comment.all.where(post_id: params[:post_id]) # comments for particullar post 
     @post = Post.find(params[:post_id]) #FIND CURRENT POST
    
     @comment = Comment.new
  end

 
  # def new
  #   @comment = Comment.new
  # end

  def show
    #debugger
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find( params[:id])
    

  end

 
 def create
   #debugger
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    @comment = Comment.new #create new object for comment 
    @comments = @post.comments #particullar show comments on post 
    respond_to do |format|
      format.js 
    end
    # if request.format.symbol != :js
    #   redirect_to root_path
    # end
    #@comment.save
    # redirect_to user_post_comments_path
  end

  def destroy
    @post = Post.find params[:post_id]
    @comment = @post.comments.find params[:id]
    @comment.destroy
    redirect_to user_post_comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:comentext)
  end
end
 