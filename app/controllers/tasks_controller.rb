class TasksController < ApplicationController
  before_action :set_category, only: [:create, :edit, :update, :destroy]

    def create
        @task = @category.tasks.create(task_params)
        redirect_to category_path(@category)
      end

    def destroy
      @task = @category.tasks.find(params[:id])
      @task.destroy
      redirect_to category_path(@category)
    end

    def edit
    end

    def update
        @task = @category.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to category_path(@category)
        else
            render :edit
        end
    end
    
      private
      def set_category
        @category = Category.find(params[:category_id])
      end

      def task_params
        params.require(:task).permit(:title, :status, :deadline)
      end
end
