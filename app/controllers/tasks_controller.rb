class TasksController < ApplicationController
  before_action :set_category, only: [:create]
    def create
        @task = @category.tasks.create(task_params)
        redirect_to category_path(@category)
      end
    
      private
      def set_category
        @category = Category.find(params[:category_id])
      end

        def task_params
          params.require(:task).permit(:title, :status)
        end
end
