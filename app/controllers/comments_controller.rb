class CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
  end

  def new
  	@comment = Comment.new
  end

  def create 
  	@comment = Comment.new(comment_params)
  	respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice: 'comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end 
  end

  private

  def comment_params
    params.require(:comment).permit(:photo_id, :user_id, :text, :score)
  end
end
