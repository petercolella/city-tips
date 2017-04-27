class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.user_id)
    @city = City.find(@post.city_id)
  end

  def new
    @city = City.find(params[:city_id])
    @post = Post.new
  end

  def create
    binding.pry
    post = Post.create(post_params)
    redirect_to city_post_path(params[:city_id])
  end

  private

  def post_params
    params.require(:post)
      .permit(:title, :content)
      .merge(user_id: current_user.id, city_id: params[:city_id])
  end
end
