class PostsController < ApplicationController
  def index
    @post = Post.all
    @posts = Post.page params[:page]
  end
  def show
    @post = Post.find(params[:id])
    @posts = Post.page params[:page]
  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    	flash[:success] = "ありがとうございます！"
    	redirect_to '/'
		else
			render 'new'
    end
  end

  private
    def post_params
      params.require(:post).permit(:name, :content)
    end
end
