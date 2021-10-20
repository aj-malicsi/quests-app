class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy] 
    before_action :authenticate_user!
    def index
        # @categories = Category.all

        @categories = current_user.categories
        @tasks = current_user.tasks.where("deadline >= ? and deadline < ?", Date.current, Date.current + 1)
    end

    def new
        # @category = Category.new
        @category = current_user.categories.build
    end

    def show
    end


    def create
        # @category = Category.new(category_params)
        @category = current_user.categories.build(category_params)

        if @category.save
            redirect_to @category, notice: 'category was successfully created'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @category.update(category_params)
            redirect_to @category
        else
            render :edit
        end

    end

    def destroy
        if @category.destroy
            redirect_to categories_path
        end
    end

    private 
        def set_category
            @category = Category.find(params[:id])
        end

        def category_params
            params.require(:category).permit(:title, :details)
        end


end
