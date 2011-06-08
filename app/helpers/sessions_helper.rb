module SessionsHelper

	def sign_in(user)
		#cookies.permanent.signed[:remember_token] = [user.id, user.salt]
											
		#cookies.signed[:prova] = {	:value => "hello cookie",
		#							:expires => 1.hour.from_now}
							
		session[:user_id] = user.id
		self.current_user = user
	end
	
	def sign_out
		#cookies.delete(:remember_token)
		session[:user_id] = nil
		self.current_user = nil
	end
	
	def current_user=(user)
		@current_user = user
	end
	
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
		#@current_user ||= user_from_remember_token
    end
	
	def current_user?(user)
		user == current_user
	end
	
	def signed_in?
		!current_user.nil?
	end
	
	def authenticate
		deny_access unless signed_in?
	end
	
	def deny_access
		store_location
		redirect_to signin_path, :notice => "Please sign in to access this page."
		#this is equivalent to the more verbose:
		
		#flash[:notice] = "Please sign in to access.."
		#redirect_to signin_path
		
		#(The same construction works for the :error key, but not for :success.)
	end
	
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		clear_return_to
	end

	private
	
		def store_location
			session[:return_to] = request.fullpath
		end
		
		def clear_return_to
			session[:return_to] = nil
		end
	
		# def user_from_remember_token
			# User.authenticate_with_salt(*remember_token)
		# end
		
		# def remember_token
			# cookies.signed[:remember_token] || [nil, nil]
		# end
	
end
 