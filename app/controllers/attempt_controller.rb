class AttemptController < ApplicationController
  before_action :set_registro_medicion, only: [:show]

  def show
  end

  private
  def set_attempt
    @attempt = Api::RegistroMedicion.find(params[:id])
  end
end
