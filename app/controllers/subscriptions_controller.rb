class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all

    render("subscriptions/index.html.erb")
  end

  def show
    @subscription = Subscription.find(params[:id])

    render("subscriptions/show.html.erb")
  end

  def new
    @subscription = Subscription.new

    render("subscriptions/new.html.erb")
  end

  def create
    @subscription = Subscription.new

    @subscription.user_id = params[:user_id]
    @subscription.topic_id = params[:topic_id]

    save_status = @subscription.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/subscriptions/new", "/create_subscription"
        redirect_to("/subscriptions")
      else
        redirect_back(:fallback_location => "/", :notice => "Subscription created successfully.")
      end
    else
      render("subscriptions/new.html.erb")
    end
  end

  def edit
    @subscription = Subscription.find(params[:id])

    render("subscriptions/edit.html.erb")
  end

  def update
    @subscription = Subscription.find(params[:id])

    @subscription.user_id = params[:user_id]
    @subscription.topic_id = params[:topic_id]

    save_status = @subscription.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/subscriptions/#{@subscription.id}/edit", "/update_subscription"
        redirect_to("/subscriptions/#{@subscription.id}", :notice => "Subscription updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Subscription updated successfully.")
      end
    else
      render("subscriptions/edit.html.erb")
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])

    @subscription.destroy

    if URI(request.referer).path == "/subscriptions/#{@subscription.id}"
      redirect_to("/", :notice => "Subscription deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Subscription deleted.")
    end
  end
end