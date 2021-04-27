class ClaimantsController < ApplicationController
  before_action :set_claimant, only: %i[show]
  def show
  end

  def new
    @claimant = Claimant.new
    @poll = Poll.friendly.find(params[:poll])
  end

  def create
    @claimant = Claimant.find_or_create_by(email: params[:claimant][:email])
    @poll = Poll.friendly.find(params[:poll])
    if @claimant.present?
      @claimant.polls << @poll
      redirect_to success_poll_path(@poll)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_claimant
    @claimant = Claimant.find(params[:id])
  end

  def claimant_params
    params.require(:claimant).permit(:email)
  end
end
