class DestinationsController < ApplicationController
    
    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
        @recent_posts = Post.includes(:title).order("created_at desc").limit(5)
    end

end