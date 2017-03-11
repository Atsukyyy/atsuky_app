class TopicsController < ApplicationController
  def show
    @topic = Topic.find(params[:id])
  end
  def new
    @topic = Topic.new
  end
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
    	flash[:success] = "新しいTopic追加"
    	redirect_to '/'
		else
			render 'new'
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:kind)
    end
end
