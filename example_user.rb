class User
	attr_accessor :name, :email 		#This creates "getter" and "setter" methods for @name and @email instance variables
	
	def initialize(attributes = {}) 	#Here the attributes variable has a default value equal to the empty hash
		@name = attributes[:name]
		@email = attributes[:email]
	end
	
	def formatted_email
		"#{@name} <#{@email}>"			#that uses the values of the assigned @name and @email variables to build up a nicely formatted version of the user’s email address using string interpolation
	end
end

