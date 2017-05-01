class PostsController < ApplicationController
  # Define routes that require authentication
  before_action :authenticate_user!, only: [:new, :create]

  # Define routes that current user must be account owner else redirect
  before_action :redirect_unless_owner, only: [:edit, :update, :destroy]
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @city = @post.city
  end

  def new
    @city = City.find(params[:city_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @city = @post.city

    # If post.save fails, error messages will be automatically populated on the post object
    if @post.save
      redirect_to city_post_path(@city, @post), notice: 'Post created successfully.'
    else
      # Rerender the view with error message(s) and auto populate fields
      flash[:alert] = @post.errors.full_messages.join(", ")
      render :new
    end
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
    # Only allow expected parameters
    params.require(:post)
      .permit(:title, :content)
      .merge(user_id: current_user.id, city_id: params[:city_id])
  end

  def redirect_unless_owner
    # Protect against unauthorized changes
    post = Post.find(params[:id])
    if (current_user.id != post.user.id)
      redirect_to root_path
    end
  end
end
