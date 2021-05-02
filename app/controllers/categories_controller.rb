class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end
    
    def show
        @category = Category.find_by_id(params[:item_id])
    end

end