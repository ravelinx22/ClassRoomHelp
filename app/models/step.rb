class Step
  include Mongoid::Document

  field :result, type: String
  field :description, type: String
  field :methods, type: Array

  belongs_to :exercise
end
