class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end

    def create
        group = Group.new(name:params[:name], description:params[:description], user:current_user)
        if group.valid?
            group.save
            Member.create(group:group, user:current_user)
            redirect_to '/groups'
        else
            flash[:errors] = group.errors.full_messages
            redirect_to '/groups'
        end
    end

    def show
        @group = Group.find(params[:id])
        @members = Member.where(group:@group)
    end

    def destroy
        Group.destroy(params[:id])
        redirect_to '/groups'
    end
end
