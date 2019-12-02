class PostsController < ApplicationController
    before_action :find_by_id, only: [:edit, :show]
    
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    # def show
    #     @post = Post.find(params[:id])
    # end
    
    def create
        @post = Post.new(post_params)
        if @post.valid?
            @post.save
            redirect_to @post
        else
            render :new
        end
    end

    private

    def post_params
        params.require(:post).permit()
    end

    def find_by_id
        @post = Post.find(params[:id])
    end

end