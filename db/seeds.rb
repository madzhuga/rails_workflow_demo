[{
     email: "admin@admin.com",
     role: "admin",
     password: "Qwerty123",
     password_confirmation: "Qwerty123"
 },
 {
     email: "sales@test.com",
     role: "sale",
     password: "Qwerty123",
     password_confirmation: "Qwerty123"
 },
 {
     email: "customer@test.com",
     role: "customer",
     password: "Qwerty123",
     password_confirmation: "Qwerty123"
 },

 {
     email: "prov@test.com",
     role: "stock",
     password: "Qwerty123",
     password_confirmation: "Qwerty123"
 }].each {|attrs| User.create(attrs) }
