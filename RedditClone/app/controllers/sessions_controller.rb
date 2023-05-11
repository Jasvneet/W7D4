class SessionsController < ApplicationController

    def create
        @user = User.find_by(params[:user][:username], params[:user][:password])
        if @user
            login!(@user)
            redirect_to users_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def new
        @user = User.new
        render :new
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
end
