class Attempt
  include Mongoid::Document
  attr_accessor :steps
  attr_accessor :current_step

  belongs_to :exercise

  def initialize()
    super()
    @steps = []
  end

  def start_exercise
    @steps = exercise.steps if exercise
    @current_step = @steps.shift
  end

  def next_step
    @current_step = @steps.shift
  end

  def self.random_exercise(topic)
    return topic.exercises.sample
  end
end
