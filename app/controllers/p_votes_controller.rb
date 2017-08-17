class PVotesController < ApplicationController
  before_action :current_user_must_be_p_vote_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_p_vote_user
    p_vote = PVote.find(params[:id])

    unless current_user == p_vote.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @p_votes = PVote.page(params[:page]).per(10)

    render("p_votes/index.html.erb")
  end

  def show
    @p_vote = PVote.find(params[:id])

    render("p_votes/show.html.erb")
  end

  def new
    @p_vote = PVote.new

    render("p_votes/new.html.erb")
  end

  def create
    @p_vote = PVote.new

    @p_vote.up = params[:up]
    @p_vote.user_id = params[:user_id]
    @p_vote.post_id = params[:post_id]

    save_status = @p_vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/p_votes/new", "/create_p_vote"
        redirect_to("/p_votes")
      else
        redirect_back(:fallback_location => "/", :notice => "P vote created successfully.")
      end
    else
      render("p_votes/new.html.erb")
    end
  end

  def edit
    @p_vote = PVote.find(params[:id])

    render("p_votes/edit.html.erb")
  end

  def update
    @p_vote = PVote.find(params[:id])

    @p_vote.up = params[:up]
    @p_vote.user_id = params[:user_id]
    @p_vote.post_id = params[:post_id]

    save_status = @p_vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/p_votes/#{@p_vote.id}/edit", "/update_p_vote"
        redirect_to("/p_votes/#{@p_vote.id}", :notice => "P vote updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "P vote updated successfully.")
      end
    else
      render("p_votes/edit.html.erb")
    end
  end

  def destroy
    @p_vote = PVote.find(params[:id])

    @p_vote.destroy

    if URI(request.referer).path == "/p_votes/#{@p_vote.id}"
      redirect_to("/", :notice => "P vote deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "P vote deleted.")
    end
  end
end
