class PostsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_post, only: [ :edit, :update, :destroy ]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Current.user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted successfully"
  end

  private
    def set_post
      @post = Current.user.posts.find(params[:id])
    end

    def post_params
      params.expect(post: [ :title, :content, :status, :category_id ])
    end
end
