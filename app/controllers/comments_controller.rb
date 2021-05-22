class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    # @prototype = Prototype.find(params[:id])
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
      #必要ならこの上の行にこれを入れる？ (@comment.prototype.id)(@commnet.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end