class ItemsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
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

    private 

    def item_params
        params.require(:item).permit(:title, :description)
    end
    
end
