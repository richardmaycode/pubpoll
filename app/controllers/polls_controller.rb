class PollsController < ApplicationController
  before_action :set_poll, only: %i[show settings]

  def index
    @polls = Poll.all
  end

  def show; end

  def new
    @poll = Poll.new
    2.times{ @poll.choices.build } 
  end

  def create
    @poll = Poll.create(poll_params)

    if @poll.save
      redirect_to poll_path(@poll), success: "Poll created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if !params[:access_token].present?
      redirect_to lookup_polls_path
    else
      @poll = Poll.friendly.find(params[:id])

      if @poll.access_token != params[:access_token]
        redirect_to lookup_polls_path
      end
    end
  end

  def settings; end

  def search; end

  def lookup; end

  private

  def set_poll
    @poll = Poll.includes(:choices).friendly.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:title, :email, choices_attributes: [:title, :url, :_destroy])
  end
end
