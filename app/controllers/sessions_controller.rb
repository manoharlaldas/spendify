class SessionsController < ApplicationController
  

  # POST /sessions
  # POST /sessions.json

  # def create
  #   user = User.find_by_email(user_email)
  #   if user && user.authenticate(user_password)
  #     sign_in_user(user)
  #     render json: { user_id: user.id }
  #   else
  #     render json: { message: "Invalid email or password"}, status: 404
  #   end
  # end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to homes_path, notice: 'Logged in successfully.'
    else
      redirect_to login_path, notice: 'Invalid Email or Password.'
    end
  end

 
  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged Out successfully.'
  end
  
  # def user_email
  #   params[:user][:password]
  # end
  # def user_password
  #   parmas[:user][:password]
  # end
end
