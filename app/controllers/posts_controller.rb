class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
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
    if @post.save
      redirect_to city_post_path(@city, @post), notice: 'Post created successfully.'
    else
      flash[:alert] = @post.errors.full_messages.join(", ")
      # binding.pry
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @city = @post.city
  end

  # # POST /notes
  # def create
  #   @note = Note.new(note_params)
  #
  #   if @note.save
  #     redirect_to @note, notice: 'Note was successfully created.'
  #   else
  #     render :new
  #   end
  # end
  #
  # # PATCH/PUT /notes/1
  # def update
  #   @note = current_user.notes.find(params[:id])
  #
  #   if @note.update(note_params)
  #     redirect_to @note, notice: 'Note was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end
  #
  # # DELETE /notes/1
  # def destroy
  #   @note = current_user.notes.find(params[:id])
  #
  #   @note.destroy
  #
  #   redirect_to notes_url, notice: 'Note was successfully destroyed.'
  # end

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

  def redirect_unless_owner
    post = Post.find(params[:id])
    if (current_user.id != post.user.id)
      redirect_to root_path
    end
  end
end
