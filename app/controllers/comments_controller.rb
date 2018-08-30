class CommentsController < ApplicationController
  before_action :set_project, only: [:new, :edit, :create, :index, :destroy]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @project.comments
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = @project.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash.now[:notice] = 'Comment was successfully created.'
    else
      set_project
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
       flash.now[:notice] = 'Comment was successfully updated.'
    else
      set_project
      set_comment
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash.now[:notice] = 'Comment was successfully destroyed.'
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
