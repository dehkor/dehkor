class Blog::PostsController < ApplicationController

  def index
    @posts = BlogPost.all
  end

  def new
    @post = BlogPost.new
  end

  def edit
    @post = BlogPost.find(params[:id])
  end

  def create
    @post = BlogPost.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = BlogPost.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def show
    @post = BlogPost.find(params[:id])
  end

  private
    def post_params
      params.require(:blog_post).permit(:title, :text)
    end

end
