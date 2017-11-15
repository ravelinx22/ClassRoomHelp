class Exercise
  include Mongoid::Document

  field :statement, type: String
  field :image_url, type: String
  has_and_belongs_to_many :topics
  has_many :steps
  has_many :attempts
end
