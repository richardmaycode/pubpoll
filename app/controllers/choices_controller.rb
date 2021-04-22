class ChoicesController < ApplicationController
  before_action :set_poll
  before_action :set_choice, only: %i[show edit update destroy]

  def show
  end

  def new
    @choice = @poll.choices.new
  end

  def create
    @choice = @poll.choices.create(choice_params)

    respond_to do |format|
      if @choice.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("choices", partial: "choices/choice", locals: {choice: @choice})
        end
        format.html { redirect_to private_poll_path(@poll) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @choice.update(choice_params)
        format.html { redirect_to private_poll_path(@poll) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @choice.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@choice) }
      format.html { redirect_to poll_path(@poll) }
    end
  end

  private

  def set_choice
    @choice = Choice.find(params[:id])
  end

  def set_poll
    @poll = Poll.friendly.find(params[:poll_id])
  end

  def choice_params
    params.require(:choice).permit(:title, :url, :content)
  end
end
