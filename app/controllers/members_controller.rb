class MembersController < ApplicationController
  def create
    if Member.find_by(group:Group.find(params[:group_id]), user:current_user)
      redirect_to '/groups/' + params[:group_id].to_s
    else
      Member.create(group:Group.find(params[:group_id]), user:current_user)
      redirect_to '/groups/' + params[:group_id].to_s
    end
  end

  def destroy
    Member.destroy(Member.find_by(group_id:params[:id], user_id:session[:user_id]))
    redirect_to '/groups/' + params[:id].to_s
  end
end
