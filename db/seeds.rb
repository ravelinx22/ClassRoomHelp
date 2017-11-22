User.delete_all
Attempt.delete_all
Step.delete_all
Exercise.delete_all
Topic.delete_all
Subject.delete_all

User.new(email: "drummerwilliam@gmail.com", password: "123456",password_confirmation: "123456").save!

topic1 = Topic.new(name: "Algebra relacional")
topic1.save!
topic2 = Topic.new(name: "Sentencias SQL")
topic2.save!
topic3 = Topic.new(name: "Tablas")
topic3.save!
topic4 = Topic.new(name: "Media, Mediana, Moda")
topic4.save!
topic5 = Topic.new(name: "Teorema Limite Central")
topic5.save!
topic6 = Topic.new(name: "Distribuciones")
topic6.save!
topic7 = Topic.new(name: "Desarrollo de la persistencia")
topic7.save!
topic8 = Topic.new(name: "Desarrollo del front-end")
topic8.save!
topic9 = Topic.new(name: "Desarrollo de servicios")
topic9.save!

subject1 = Subject.new(name: "Sistrans")
subject1.topics << topic1
subject1.topics << topic2
subject1.topics << topic3
subject1.save!

subject2 = Subject.new(name: "Probabilidad")
subject2.topics << topic4
subject2.topics << topic5
subject2.topics << topic6
subject2.save!

subject3 = Subject.new(name: "Desarrollo de SW en equipos")
subject3.topics << topic7
subject3.topics << topic8
subject3.topics << topic9
subject3.save!


Subject.new(name: "Diferencial").save!
Subject.new(name: "Integral").save!
Subject.new(name: "Lineal").save!

step1 = Step.new(description: "Calcular suma de numeros del conjunto")
step2 = Step.new(description: "Calcular cuantos numero hay en el conjunto")
step3 = Step.new(description: "Dividir la suma sobre el numero de datos")

step4 = Step.new(description: "Entidad")
step5 = Step.new(description: "Persistencia para crear")
step6 = Step.new(description: "Logica para crear")

exercise1 = Exercise.new(statement: "Halle la media de los siguientes numeros:\n2+5+3+6+8+8+6+3+2+5+7+5+3+2+34+5")
exercise1.topics << topic4
topic4.exercises << exercise1

exercise2 = Exercise.new(statement: "Halle la moda de los siguientes numeros:\n2+5+3+6+8+8+6+3+2+5+7+5+3+2+34+5")
exercise2.topics << topic4
topic4.exercises << exercise2

exercise3 = Exercise.new(statement: "Halle la mediana de los siguientes numeros:\n2+5+3+6+8+8+6+3+2+5+7+5+3+2+34+5")
exercise3.topics << topic4
topic4.exercises << exercise3

exercise4 = Exercise.new(statement: "Para el concepto de Cliente del siguiente diagrama de clases desarrolle las clases encargadas de representar a la entidad, la persistencia y la lógica. Incluya todos los atributos y relaciones que se muestran en el diagrama.")
exercise4.image_url = "http://neidybeltran95.blogspot.es/cache/media/files/00/082/789/2013/12/45654.png"
exercise4.topics << topic7
topic7.exercises << exercise4

step1.exercise = exercise1
step2.exercise = exercise1
step3.exercise = exercise1

step4.exercise = exercise4
step5.exercise = exercise4
step6.exercise = exercise4

exercise1.save
exercise2.save
exercise3.save
exercise4.save

step1.save
step2.save
step3.save

step4.save
step5.save
step6.save
