class PostsController < ApplicationController
    def index
        @posts=Post.all 
    end

    def new
        @post= current_user.posts.build
    end

    def create
        @post= current_user.posts.build(post_params)
        if @post.save
            redirect_to root_url, notice: "Post created"
        else
            render :new
        end
        
 
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
end
