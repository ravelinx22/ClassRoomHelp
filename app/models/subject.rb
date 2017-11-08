<<<<<<< HEAD
class Subject
  include Mongoid::Document

  field :name, type: String
end
=======
class Subject
  include Mongoid::Document

  field :name, type: String

  has_and_belongs_to_many :topics
end
>>>>>>> 15c44b7a61191cb3966860e2947e8989559f592e
