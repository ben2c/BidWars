class ItemsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @items = @user.items.alpha
        else
            @error = "That item does not exist. Please try again." if params[:user_id]
            @items = Item.alpha
        end
    end
    
    def delete
        @item = Item.find_by(id: params[:id])
        @item.delete
 
        redirect '/items'
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

    def edit
        set_item
        redirect_to items_path if !@item || @item.user != current_user
    end

    def update
        set_item
        redirect_to items_path if !@item || @item.user != current_user
       if @item.update(item_params)
         redirect_to item_path(@item)
       else
         render :edit
       end
     end

    def show
        set_item
    end

    private 

    def item_params
        params.require(:item).permit(:title, :description)
    end
    
    def set_item
        @item = Item.find_by_id(params[:id])
    end

end
