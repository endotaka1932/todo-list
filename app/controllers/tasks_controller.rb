class TasksController < ApplicationController

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        @task.user_id = current_user.id
        if @task.save!
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
    end

    def updatate
    end

    def destroy
    end

    private
        def task_params
            params.require(:task).permit(:title, :content, :deadline, :eyecatch)
        end

end
