class PollsController < ApplicationController
  before_action :set_poll, only: %i[show settings private update success]

  def index
    @polls = Poll.all
  end

  def show
  end

  def new
    @poll = Poll.new
    2.times { @poll.choices.build }
  end

  def create
    @poll = Poll.create(poll_params)

    if @poll.save
      redirect_to private_poll_path(@poll), success: "Poll created!"
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

  def update
    if @poll.update(poll_params)
      redirect_to poll_path(@poll)
    else
      render :edit
    end
  end

  def settings
  end

  def search
  end

  def lookup
  end

  def private
  end

  def success
  end
  private

  def set_poll
    @poll = Poll.includes(:choices).friendly.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:title, :email, :allow_recommendations, :allow_sharing, :discoverable, :published, choices_attributes: [:title, :url, :content, :_destroy])
  end
end
