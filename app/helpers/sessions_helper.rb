module SessionsHelper

	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		#self.current = user
		#segons la web
		session[:user_id] = user.id
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_path, notice: "Please sign in."
		end
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
		user == current_user
	end

	# Remembers a user in a persistent session.
	def remember(user)
	  #user.remember
	  cookies.permanent.signed[:user_id] = user.id
	  cookies.permanent[:remember_token] = user.remember_token
	end

	  # Returns the current logged-in user (if any).
	  def current_user
	    if (user_id = session[:user_id])
	      @current_user ||= User.find_by(id: user_id)
	    elsif (user_id = cookies.signed[:user_id])
	      user = User.find_by(id: user_id)
	      if user && user.authenticated?(:remember, cookies[:remember_token])
	        log_in user
	        @current_user = user
	      end
	    end
	  end
  
	  # Forgets a persistent session.
	  def forget(user)
	    user.forget
	    cookies.delete(:user_id)
	    cookies.delete(:remember_token)
	  end

	  # Signs out the current user.
	  def sign_out
	  	self.current_user = nil
	  	cookies.delete(:remember_token)
	  	#segons la web
		    #forget(current_user)
		    #session.delete(:user_id)
		    #@current_user = nil
	  end

	  def redirect_back_or (default)
	  	redirect_to (session[:return_to] || default)
	  	session.delete(:return_to)
	  end

	  def store_location
	  	session[:return_to] = request.fullpath
	  end
end
