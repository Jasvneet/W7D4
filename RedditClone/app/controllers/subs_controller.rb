class SubsController < ApplicationController
    def index 
        @subs = Sub.all
        render :index 
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = params[:user_id]
        if @sub.save
            login!(@sub)
            redirect_to subs_url
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def new
        @sub =Sub.new
        render :new
    end

    def show
        @sub =Sub.find_by(id: params[:id])
    end

    def edit 
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            redirect_to subs_url
        end
    end

    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
