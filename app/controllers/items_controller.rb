class ItemsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        @items = Item.all
        if params[:user_id] && @user = User.find_by_id(:user_id)
            @comments = @user.comments
        else
            @error = "That item does not exist. Please try again." if params[:user_id]
            @items = Item.all 
        end
    end
    

    def new
        @item = Item.new
    end
    
    def create
        @item = current_user.items.build(item_params)
        if @item.save
            redirect_to items_path
        else
            render :new 
        end
    end

    def show
        @item = Item.find(params[:id])
    end

    private 

    def item_params
        params.require(:item).permit(:title, :description)
    end
    
end
