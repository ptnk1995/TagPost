class PostsController < ApplicationController
  def index
  	if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
  end

  def show
    
  end

  def create
  	@post= Post.new post_params
    
  	respond_to do |format|
  		if @post.save
  			format.js
  		else
  			format.html { render root_path }
  		end
  	end
  end

  def post_params
  	params.require(:post).permit(:author, :content, :all_tags)
  end
end
