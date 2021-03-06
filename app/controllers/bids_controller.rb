class BidsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        if params[:item_id] && @item = Item.find_by_id(:item_id)
            @bids = @item.bids.highest_bidder
        else
            @error = "That item does not exist. Please try again." if params[:item_id]
            @bids = Bid.highest_bidder

        end
    end

    def new
        #if nested and we find the item
        if params[:item_id] && @item = Item.find_by_id(params[:item_id])
            @bid = @item.bids.build
        else
            #@error = "That item does not exist. Default item is selected."
            @bid = Bid.new
        end
    end
    
    def create
        @bid = current_user.bids.build(bid_params)
        if @bid.save
            redirect_to bids_path
        else
            render :new 
        end
    end

    def show
        @bid = Bid.find_by(id: params[:id])
    end

    private 

    def bid_params
        params.require(:bid).permit(:price, :item_id)
    end
    
end
