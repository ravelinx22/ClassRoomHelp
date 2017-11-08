User.delete_all
Subject.delete_all

User.new(email: "drummerwilliam@gmail.com", password: "123456",password_confirmation: "123456").save!

Subject.new(name: "Sistrans").save!
Subject.new(name: "Probabilidad").save!
Subject.new(name: "Diferencial").save!
Subject.new(name: "Integral").save!
Subject.new(name: "Lineal").save!
