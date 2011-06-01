# By using the simbol ':user', we get Factory Girl to simulate the user model.

Factory.define :user do |user|
  user.name					 	"Duccio Armenise"
  user.email				 	"info@duccioarmenise.it"
  user.password				 	"foobar"
  user.password_confirmation 	"foobar"
end 

Factory.sequence :email do |n|
	"person-#{n}@example.com"
end

#Exercise 10.6
Factory.sequence :name do |n|
	"Name-#{n} Surname-#{n}"
end