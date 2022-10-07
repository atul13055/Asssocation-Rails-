class PostsController < ApplicationController
	
  def index
	  @posts=Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    #@post= Post.new
  end
 	
  def create
     #debugger
   
     @post = Post.new
     @post.user_id =params[:user_id]
     @post.title = params[:title]
     @post.save
     respond_to do |format|
       format.js 
     end
      @posts=Post.all
     
     # redirect_to root_path
 end
 def destroy
    #debugger

    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path, status: :see_other
  end
 
  # private
  #  def post_params
  #  	  params.require(:post).permit(:title)
  #   end 
end


 