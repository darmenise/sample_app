# By using the simbol ':user', we get Factory Girl to simulate the user model.

Factory.define :user do |user|
  user.name					 	"Duccio Armenise"
  user.email				 	"info@duccioarmenise.it"
  user.password				 	"foobar"
  user.password_confirmation 	"foobar"
end 