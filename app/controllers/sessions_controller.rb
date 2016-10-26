class SessionsController < ApplicationController
    
    def new #new action is simply going to render a form
        
    end
    
    def create #this will start the session and display the user in logged in state
        user = User.find_by(email: params[:session][:email].downcase)
        
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "There was something wrong with your login info"
            render 'new'
        end
    end
    
    def destroy #to logout the user
        session[:user_id] = nil
        flash[:success] = "You have succesfully logged-out."
        redirect_to root_path
    end
    
end