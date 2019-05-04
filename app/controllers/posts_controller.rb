class PostsController < ApplicationController
    def new
        @post = current_user.posts.new
    end

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to root_url
        else
            render "new"
        end
    end

    def index  
        @posts= current_user.posts.all
    end

    # render plain: params.inspect
    private
        def post_params
            params.require(: post).permit(: title,: content)
        end
end