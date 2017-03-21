class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :toggle_status]


  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was removed.' }
    end
  end


  def toggle_status
    if @post.draft?
      @post.published!
    elsif @post.published?
      @post.draft!
    end

    redirect_to posts_url, notice: 'Post status has been updated.'
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
