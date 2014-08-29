class Blog::PostsController < ApplicationController

  def index
    @posts = BlogPost.all
  end

  def new
    @post = BlogPost.new
  end

  def create
    @post = BlogPost.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = BlogPost.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end

end
