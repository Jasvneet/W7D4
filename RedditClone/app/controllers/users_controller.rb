class UsersController < ApplicationController
   before_action :required_logged_in, only: [:edit, :update, :destroy]
    
    def index 
        @user = User.all
        render :index 
    end

    def create
        @user = User.new(user_params)
        if @user.save
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

    def show
        @user = User.find_by(id: params[:id])
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        redirect_to users_url
    end

    def edit 
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            redirect_to users_url
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
