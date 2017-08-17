class TopicsController < ApplicationController
  def index
    @topics = Topic.page(params[:page]).per(10)

    render("topics/index.html.erb")
  end

  def show
    @post = Post.new
    @subscription = Subscription.new
    @topic = Topic.find(params[:id])

    render("topics/show.html.erb")
  end

  def new
    @topic = Topic.new

    render("topics/new.html.erb")
  end

  def create
    @topic = Topic.new

    @topic.name = params[:name]
    @topic.subject = params[:subject]

    save_status = @topic.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/topics/new", "/create_topic"
        redirect_to("/topics")
      else
        redirect_back(:fallback_location => "/", :notice => "Topic created successfully.")
      end
    else
      render("topics/new.html.erb")
    end
  end

  def edit
    @topic = Topic.find(params[:id])

    render("topics/edit.html.erb")
  end

  def update
    @topic = Topic.find(params[:id])

    @topic.name = params[:name]
    @topic.subject = params[:subject]

    save_status = @topic.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/topics/#{@topic.id}/edit", "/update_topic"
        redirect_to("/topics/#{@topic.id}", :notice => "Topic updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Topic updated successfully.")
      end
    else
      render("topics/edit.html.erb")
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    @topic.destroy

    if URI(request.referer).path == "/topics/#{@topic.id}"
      redirect_to("/", :notice => "Topic deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Topic deleted.")
    end
  end
end
