class Attempt
  include Mongoid::Document

  field :done_steps, type: Array
  field :current_steps
  belongs_to :exercise

  def initialize()
    super()
  end

  def start_exercise_if_necessary
    update_attributes(done_steps: []) if done_steps == nil
    update_attributes(current_steps: []) if current_steps == nil
    if exercise
      exercise.steps.each do |step|
        if !done_steps.include? step
          current_steps << step
        end
      end
    end
  end
end
