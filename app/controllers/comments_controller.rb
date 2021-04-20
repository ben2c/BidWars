class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        if params[:item_id] && @item = Item.find_by_id(:item_id)
            @comments = @item.comments
        else
            @error = "That item does not exist. Please try again."
            @comments = Comment.all 
        end
    end

    def new
        #if nested and we find the item
        if params[:item_id] && @item = Item.find_by_id(params[:item_id])
            @comment = @item.comments.build
        else
            @error = "That item does not exist. Default item is selected."
            @comment = Comment.new
            @comment.build_item
        end
    end
    
    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new 
        end
    end

    def show
        @comment = Comment.find_by(id: params[:id])
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        @comment = Comment.find_by(id: params[:id])
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            redirect :edit 
        end
    end

    private 

    def comment_params
        params.require(:comment).permit(:content, :post_id)
    end
    
end
