class PostsController < ApplicationController
  before_action :authenticate_user
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = current_user.posts.all
  end

  def edit
    @post = current_user.posts.find(params[:id])
    #  render plain: params.inspect
  end

  def update
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    # render plain: params.inspect
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  # render plain: params.inspect
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
