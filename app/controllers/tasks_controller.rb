class TasksController < ApplicationController
    before_action :authenticate_user!
        def show
        @board = Board.find(params[:board_id])
        @task = Task.find(params[:id])
        @comments = @task.comments
    end

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        @task.user_id = current_user.id
        if @task.save
            redirect_to board_path(@task.board_id), notice: '追加しました'
        else
            flash.now[:error] = '保存に失敗しました'
            render :new
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        board = Board.find(params[:board_id])
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to board_path(board), notice: '更新しました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    def destroy
        board = Board.find(params[:board_id])
        @task = Task.find(params[:id])
        @task.destroy!
            redirect_to board_path(board), notice: '削除しました'
    end

    private
        def task_params
            params.require(:task).permit(:title, :content, :deadline, :eyecatch)
        end

end
