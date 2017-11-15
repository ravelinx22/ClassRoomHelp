class Attempt
  include Mongoid::Document
  has_many :steps
  belongs_to :exercise

  def initialize()
    super()
  end

  def get_current_steps
    current_steps = []
    puts exercise.to_json

    if exercise
      exercise.steps.each do |step|
        if !steps.include? step
          current_steps << step
        end
      end
    end

    return current_steps
  end

  def next_step
    exer = get_current_steps()[0]
    steps << exer

    if get_current_steps()[0] == nil
      return true
    else
      return false
    end
  end
end
