class Blog::PostsController < ApplicationController

  def index
    @posts = BlogPost.all
  end

  def new
  end

  def create
    @post = BlogPost.new(post_params)

    @post.save
    redirect_to @post
  end

  def show
    @post = BlogPost.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end

end
