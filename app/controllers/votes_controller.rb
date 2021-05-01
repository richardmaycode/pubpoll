class VotesController < ApplicationController
  before_action :set_poll

  def show
    @vote = Vote.find(params[:id])
  end

  def new
    @vote = Vote.new
  end

  def create
    @new_record = false
    @vote = @poll.votes.find_or_initialize_by(user_identifier: session[:user_identifier]) do |v|
      @new_record = true
      v.update(vote_params)
    end
    puts "New Record: #{@new_record}"
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
    params.require(:vote).permit(:user_identifier, :content, :choice_id)
  end
end
