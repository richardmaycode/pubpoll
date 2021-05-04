class RecommendationsController < ApplicationController
  before_action :set_poll
  before_action :set_recommendation, only: %i[show]

  def show
  end

  def new
    @recommendation = @poll.recommendations.build
  end

  def create
    new_record = false
    @recommendation = @poll.recommendations.find_or_initialize_by(user_identifier: session[:user_identifier]) do |r|
      new_record = true
      r.update(recommendation_params)
    end

    if @recommendation.save
      redirect_to poll_recommendation_path(@poll, @recommendation, new_record: new_record)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  def set_poll
    @poll = Poll.friendly.find(params[:poll_id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:title, :url, :content, :user_identifier)
  end
end
