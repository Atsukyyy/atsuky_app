class PostsController < ApplicationController
  def index
    @post = Post.all
    #@posts = Post.page params[:page]
  end
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.build
    #@posts = Post.page params[:page]
  end
  def new
    @post = Post.new
    # 関連オブジェクトをbuild
    #@post.comments.build
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
  def update
    @post = Post.find(params[:id])
    @comment = @post.comments.build(post_params)
    if @post.update_attributes(post_params)
      flash[:success] = "updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  private
    def post_params
      params.require(:post).permit(:name, :content, comments_attributes: [:name, :content, :post_id, :id])#comment_attributes: [:name, :content])
    end
    def comment_params
      params.require(:comment).permit(:name, :content)
    end
end
