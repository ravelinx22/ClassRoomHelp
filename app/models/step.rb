class Step
  include Mongoid::Document

  field :result, type: String
  field :description, type: String

  belongs_to :exercise
  belongs_to :attempt, optional: true
end
