class RegistrationsController < ApplicationController
	def new
	
	end

	def create
        @user = User.new({
              :name => params[:name],
              :last_name => params[:last_name],
              :email => params[:email],
              :password => params[:password],
              :phone => params[:phone],
            })
        if @user.save
            flash[:notice] = "SUCCESS"
            redirect_to @user
                
        else
            flash.now[:error] = "ERROR"
            render action: "new"
              
        end
	end
end
