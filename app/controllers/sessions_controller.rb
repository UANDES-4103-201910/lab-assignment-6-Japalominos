class SessionsController < ApplicationController
	def new
	end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to root_url, :notice => "Logged in!"
        else
          redirect_to login_url, info: "Invalid email or password"
        end
    end

	def destroy
		@_current_user = session[:current_user_id] = nil
        redirect_to root_url, notice: "You have successfully logged out."
	end
end
