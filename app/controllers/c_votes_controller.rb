class CVotesController < ApplicationController
  before_action :current_user_must_be_c_vote_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_c_vote_user
    c_vote = CVote.find(params[:id])

    unless current_user == c_vote.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = CVote.ransack(params[:q])
    @c_votes = @q.result(:distinct => true).includes(:user, :comment).page(params[:page]).per(10)

    render("c_votes/index.html.erb")
  end

  def show
    @c_vote = CVote.find(params[:id])

    render("c_votes/show.html.erb")
  end

  def new
    @c_vote = CVote.new

    render("c_votes/new.html.erb")
  end

  def create
    @c_vote = CVote.new

    @c_vote.up = params[:up]
    @c_vote.user_id = params[:user_id]
    @c_vote.comment_id = params[:comment_id]

    save_status = @c_vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/c_votes/new", "/create_c_vote"
        redirect_to("/c_votes")
      else
        redirect_back(:fallback_location => "/", :notice => "C vote created successfully.")
      end
    else
      render("c_votes/new.html.erb")
    end
  end

  def edit
    @c_vote = CVote.find(params[:id])

    render("c_votes/edit.html.erb")
  end

  def update
    @c_vote = CVote.find(params[:id])

    @c_vote.up = params[:up]
    @c_vote.user_id = params[:user_id]
    @c_vote.comment_id = params[:comment_id]

    save_status = @c_vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/c_votes/#{@c_vote.id}/edit", "/update_c_vote"
        redirect_to("/c_votes/#{@c_vote.id}", :notice => "C vote updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "C vote updated successfully.")
      end
    else
      render("c_votes/edit.html.erb")
    end
  end

  def destroy
    @c_vote = CVote.find(params[:id])

    @c_vote.destroy

    if URI(request.referer).path == "/c_votes/#{@c_vote.id}"
      redirect_to("/", :notice => "C vote deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "C vote deleted.")
    end
  end
end
