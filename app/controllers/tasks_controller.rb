class TasksController < ApplicationController

    def show
    end

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        @task.user_id = current_user.id
        if @task.save!
            redirect_to board_task_path(@task.id)
        else
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
            flash[:error] = '更新できませんでした'
            render :edit_board_task_path
        end
    end

    def destroy
    end

    private
        def task_params
            params.require(:task).permit(:title, :content, :deadline, :eyecatch)
        end

end
