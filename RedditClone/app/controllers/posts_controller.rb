class PostsController < ApplicationController
    def create
        @post = Post.new(post_params)
        @post.author_id = params[:user_id]
        if @post.save
            login!(@post)
            redirect_to posts_url
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def new
        @post = Post.new
        render :new
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def edit 
        @post =  Post.find_by(id: params[:id])
        render :edit
    end

    def update
        @post =  Post.find_by(id: params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            redirect_to posts_url
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy
        redirect_to posts_url
    end

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
    end
end
