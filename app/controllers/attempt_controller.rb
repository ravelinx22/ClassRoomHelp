class AttemptController < ApplicationController
  before_action :set_attempt, only: [:show, :check_attempt]

  def show
  end

  def check_attempt
    name_step = @attempt.get_current_steps.first.description

    if name_step == "Entidad"
      verificar_entidad params[:user_logic]
    elsif name_step == "Persistencia para crear"
      verificar_persistencia params[:user_logic]
    elsif name_step == "Logica para crear"
      verificar_logica params[:user_logic]
    end
  end

  def feedback
  end

  def try_more_exercises
  end

  private
    def set_attempt
      @attempt = Attempt.find(params[:id])
    end

    def verificar_entidad user_input
      acabo = @attempt.next_step

      if acabo
        @attempt.steps.clear
        redirect_to attempt_feedback_path
      end

      verificado = false
      p1 = @attempt.verify_annotation(user_input.lines[0]) if user_input.lines[0] && user_input.lines[0].strip != ''
      p2 = @attempt.verify_class(user_input.lines[1]) if user_input.lines[1] && user_input.lines[1].strip != ''
      p3 = @attempt.verify_annotation(user_input.lines[2]) if user_input.lines[2] && user_input.lines[2].strip != ''
      p4 = @attempt.verify_annotation(user_input.lines[3]) if user_input.lines[3] && user_input.lines[3].strip != ''
      p5 = @attempt.verify_attribute(user_input.lines[4]) if user_input.lines[4] && user_input.lines[4].strip != ''
      p6 = @attempt.verify_attribute(user_input.lines[6]) if user_input.lines[6] && user_input.lines[6].strip != ''
      p7 = @attempt.verify_attribute(user_input.lines[8]) if user_input.lines[8] && user_input.lines[8].strip != ''
      p8 = @attempt.verify_attribute(user_input.lines[10]) if user_input.lines[10] && user_input.lines[10].strip != ''

      if p1 && p2 && p3 && p4 && p5 && p6 && p7 && p8
        verificado = true
      end

      if verificado
        flash[:success] = "Esta bien"
        @attempt.move_next_step
        redirect_to attempt_path(@attempt.id)
      else
        flash[:danger] = "Esta mal"
        exercise_name = "Desarrollo de la entidad, persistencia y logica de un modelo."
        redirect_to attempt_try_more_exercises_path(@attempt.id, tema: "Desarrollo de entidades", nombre_exercise: exercise_name, id_exercise: @attempt.exercise.id)
      end
    end


    def verificar_persistencia user_input
      acabo = @attempt.next_step

      if acabo
        @attempt.steps.clear
        redirect_to attempt_feedback_path
      end

      verificado = false
      p1 = @attempt.verify_annotation(user_input.lines[0]) if user_input.lines[0] && user_input.lines[0].strip != ''
      p2 = @attempt.verify_class(user_input.lines[1]) if user_input.lines[1] && user_input.lines[1].strip != '' && user_input.lines[1].strip.include?("Persistence")
      p3 = @attempt.verify_annotation(user_input.lines[2]) if user_input.lines[2] && user_input.lines[2].strip != ''
      p4 = @attempt.verify_attribute(user_input.lines[3]) if user_input.lines[3] && user_input.lines[3].strip != ''
      p5 = @attempt.verify_method(user_input.lines[5]) if user_input.lines[5] && user_input.lines[5].strip != ''

      if p1 && p2 && p3 && p4 && p5
        verificado = true
      end

      if verificado
        flash[:success] = "Esta bien"
        @attempt.move_next_step
        redirect_to attempt_path(@attempt.id)
      else
        flash[:danger] = "Esta mal"
        exercise_name = "Desarrollo de la entidad, persistencia y logica de un modelo."
        redirect_to attempt_try_more_exercises_path(@attempt.id, tema: "Desarrollo de persistencia", nombre_exercise: exercise_name, id_exercise: @attempt.exercise.id)
      end
    end

    def verificar_logica user_input
      acabo = @attempt.next_step

      if acabo
        @attempt.steps.clear
        redirect_to attempt_feedback_path
      end

      verificado = false
      p1 = @attempt.verify_annotation(user_input.lines[0]) if user_input.lines[0] && user_input.lines[0].strip != '' && user_input.lines[0].strip == "@Stateless"
      p2 = @attempt.verify_class(user_input.lines[1]) if user_input.lines[1] && user_input.lines[1].strip != '' && user_input.lines[1].strip.include?("Logic")
      p3 = @attempt.verify_annotation(user_input.lines[2]) if user_input.lines[2] && user_input.lines[2].strip != ''
      p4 = @attempt.verify_attribute(user_input.lines[3]) if user_input.lines[3] && user_input.lines[3].strip != ''
      p5 = @attempt.verify_method(user_input.lines[5]) if user_input.lines[5] && user_input.lines[5].strip != ''

      if p1 && p2 && p3 && p4 && p5
        verificado = true
      end

      if verificado
        @attempt.move_next_step
        @attempt.steps.clear
        redirect_to attempt_feedback_path
      else
        flash[:danger] = "Esta mal"
        exercise_name = "Desarrollo de la entidad, persistencia y logica de un modelo."
        redirect_to attempt_try_more_exercises_path(@attempt.id, tema: "Desarrollo de logica", nombre_exercise: exercise_name, id_exercise: @attempt.exercise.id)
      end
    end
end
