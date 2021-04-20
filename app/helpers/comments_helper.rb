module CommentsHelper

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
            tag.h1("All the Comments for #{item.title}")
        else
            tag.h1("All the Comments")
        end
    end
end
