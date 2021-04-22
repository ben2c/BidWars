module BidsHelper

    def display_item_fields(i)
        if params[:item_id]
            i.hidden_field :item_id
        else
            render partial: 'item_select'
            
            #, locals: {f: i}
        end
    end

    def display_header(item)
        if item
            tag.h1("Current for #{item.title}")
        else
            tag.h1("Current Bids")
        end
    end
end
