class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
    @author = @post.user
    @city = @post.city
  end

  def new
    @city = City.find(params[:city_id])
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    city = post.city
    redirect_to city_post_path(city, post)
  end

  def edit
    @post = Post.find(params[:id])
    @city = @post.city
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to city_post_path(post.city, post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post)
      .permit(:title, :content)
      .merge(user_id: current_user.id, city_id: params[:city_id])
  end
end
