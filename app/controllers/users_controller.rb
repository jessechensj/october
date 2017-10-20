class UsersController < ApplicationController
    skip_before_action :require_login, only: [:index, :create]
    
    def index
    end
  
    def create
      user = User.new(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], password:params[:password])
      if user.valid?
        user.save
        redirect_to '/'
      else
        flash[:errors] = user.errors.full_messages
        redirect_to '/'
      end
    end
  end
  
