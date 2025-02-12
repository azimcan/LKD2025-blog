class CommentsController < ApplicationController
  before_action :set_post, only: [ :edit, :update, :destroy ]
  before_action :set_comment, only: [ :edit, :update, :destroy ]

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = Current.user

    if @comment.save
      respond_to do |format|
        flash[:notice] = "Comment created successfully"
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: "Comment updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      redirect_to post_comments_path(@post), notice: "Comment deleted successfully"
    else
      redirect_to post_comments_path(@post), alert: @comment.errors.full_messages.join(", ")
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
      params.expect(comment: [ :content ])
    end
end
