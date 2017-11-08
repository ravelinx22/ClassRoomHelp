User.delete_all
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