class Attempt
  include Mongoid::Document
  field :current_counted_errors, type: Integer, :default => 0
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

  def move_next_step
    exer = get_current_steps()[0]
    steps << exer

    if get_current_steps()[0] == nil
      return true
    else
      return false
    end
  end

  def next_step
    exer = get_current_steps()[0]

    if get_current_steps()[0] == nil
      return true
    else
      return false
    end
  end

  def verify_method(user_input)
    response = HTTParty.get('https://nodeclassroomhelp.mybluemix.net/clasificador',
                          :query => { :daniela => user_input }
                        )

    if JSON.parse(response.body)['tipoElemento'] == "metodo"
      return true
    else
      return false
    end
  end

  def verify_attribute(user_input)
    response = HTTParty.get('https://nodeclassroomhelp.mybluemix.net/clasificador',
                          :query => { :daniela => user_input }
                          )

    if JSON.parse(response.body)['tipoElemento'] == "atributo"
      return true
    else
      return false
    end
  end

  def verify_annotation(user_input)
    response = HTTParty.get('https://nodeclassroomhelp.mybluemix.net/clasificador',
                          :query => { :daniela => user_input }
                        )

    if JSON.parse(response.body)['tipoElemento'] == "anotacion"
      return true
    else
      return false
    end
  end

  def verify_class(user_input)
    response = HTTParty.get('https://nodeclassroomhelp.mybluemix.net/clasificador',
                          :query => { :daniela => user_input }
                        )

    if JSON.parse(response.body)['tipoElemento'] == "clase"
      return true
    else
      return false
    end
  end
end
