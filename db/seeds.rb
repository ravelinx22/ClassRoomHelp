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

Subject.new(name: "Diferencial").save!
Subject.new(name: "Integral").save!
Subject.new(name: "Lineal").save!

step1 = Step.new(description: "Calcular suma de numeros del conjunto")
step2 = Step.new(description: "Calcular cuantos numero hay en el conjunto")
step3 = Step.new(description: "Dividir la suma sobre el numero de datos")


exercise1 = Exercise.new(statement: "Halle la media de los siguientes numeros:\n2+5+3+6+8+8+6+3+2+5+7+5+3+2+34+5")
exercise1.image_url = "http://neidybeltran95.blogspot.es/cache/media/files/00/082/789/2013/12/45654.png"
exercise1.topics << topic4
topic4.exercises << exercise1

exercise2 = Exercise.new(statement: "Halle la moda de los siguientes numeros:\n2+5+3+6+8+8+6+3+2+5+7+5+3+2+34+5")
exercise2.topics << topic4
topic4.exercises << exercise2

exercise3 = Exercise.new(statement: "Halle la mediana de los siguientes numeros:\n2+5+3+6+8+8+6+3+2+5+7+5+3+2+34+5")
exercise3.topics << topic4
topic4.exercises << exercise3

step1.exercise = exercise1
step2.exercise = exercise1
step3.exercise = exercise1

exercise1.save
exercise2.save
exercise3.save

step1.save
step2.save
step3.save

attempt1 = Attempt.new
attempt1.exercise = exercise1
attempt1.save!
