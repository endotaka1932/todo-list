class CommentsController < ApplicationController
    before_action :authenticate_user!
        def new
        task = Task.find(params[:task_id])
        @comment = task.comments.build
    end

    def create
        board = Board.find(params[:board_id])
        task = Task.find(params[:task_id])
        @comment = task.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to board_task_path(board_id: board.id, id: task.id), notice: '追加しました'
        else
            flash.now[:error] = '失敗しました'
            render :new
        end
    end

    def destroy
        board = Board.find(params[:board_id])
        task = Task.find(params[:task_id])
        comment = Comment.find(params[:id])
        comment.destroy!
            redirect_to board_task_path(board_id: board.id, id: task.id), notice: '削除しました'
    end

    private
        def comment_params
            params.require(:comment).permit(:content)
        end
end

