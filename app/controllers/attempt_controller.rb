class AttemptController < ApplicationController
  before_action :set_attempt, only: [:show, :check_attempt]

  def show
    @attempt.start_exercise_if_necessary

    puts @attempt.current_steps.to_json
  end

  def check_attempt
    puts params[:user_logic]
    redirect_to attempt_path(@attempt.id)
  end

  private
  def set_attempt
    @attempt = Attempt.find(params[:id])
  end
end
