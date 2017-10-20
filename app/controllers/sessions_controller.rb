class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    user = User.find_by(email:params[:email])
    if user.try(:authenticate, params[:password])
        session[:user_id] = user.id
        redirect_to '/groups'
    else
        flash[:errors] = ['Invalid user or password']
        redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end