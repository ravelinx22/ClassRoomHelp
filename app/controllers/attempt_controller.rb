class AttemptController < ApplicationController
  before_action :set_attempt, only: [:show]

  def show
  end

  private
  def set_attempt
    @attempt = Attempt.find(params[:id])
  end
end
