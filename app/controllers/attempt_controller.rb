class AttemptController < ApplicationController
  before_action :set_attempt, only: [:show, :check_attempt]

  def show
  end

  def check_attempt
    puts params[:user_logic]
    acabo = @attempt.next_step

    if acabo
      @attempt.steps.clear
      redirect_to attempt_feedback_path
    else
      redirect_to attempt_path(@attempt.id)
    end
  end

  def feedback
  end

  private
  def set_attempt
    @attempt = Attempt.find(params[:id])
  end
end
