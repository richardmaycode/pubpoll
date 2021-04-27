class VotesController < ApplicationController
  before_action :set_poll

  def show
    @vote = Vote.find(params[:id])
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.create(vote_params)

    if @vote.save
      redirect_to poll_vote_path @poll, @vote
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_poll
    @poll = Poll.friendly.find(params[:poll_id])
  end

  def vote_params
    params.require(:vote).permit(:choice_id)
  end
end
