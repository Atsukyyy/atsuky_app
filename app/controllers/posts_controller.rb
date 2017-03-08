class PostsController < ApplicationController
  def index
    #@posts = Post.all
    @posts = Post.all.paginate(page: params[:post])
  end
  def show
    @post = Post.find(params[:id])
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
			render 'new_post_path'
    end
  end

  private
    def post_params
      params.require(:post).permit(:name, :content)
    end
end
