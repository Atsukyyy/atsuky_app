class CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end
  def new
    @post = Post.find_by(params[:id])
    #@comment = @post.comments.build
  end
  def create
    @post = Post.find_by(params[:id])
    @comments = @post.comments.build(comment_params)
    if @comments.save
    	flash[:success] = "コメントを残しました！"
      redirect_to '/'
  	else
  		render 'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end
