class ItemsController < ApplicationController
    before_action :correct_user,   only: [:edit, :update]

	def new
		@item = Item.new
    end

    def create
    	@item = Item.new(item_params)
    	@item.user_id = current_user.id
    	if @item.save
        flash[:sucess] = 'レビューを投稿をしました'
    	redirect_to items_url
        else
            @items = Item.all
            render :new
        end
    end

    def index
    	@item = Item.new
    	@items = Item.all
    end

    def show
        @item = Item.find(params[:id])
        @item_comment = ItemComment.new
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
        flash[:sucess] = 'レビューを更新しました'
        redirect_to item_url(@item.id)
        else
            render :edit
        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to items_url
    end

    def correct_user
      @item = Item.find(params[:id])
      @user = @item.user
      if current_user != @user
      redirect_to items_path
      end
    end

    private
    	def item_params
    		params.require(:item).permit(:name, :price, :maker, :link, :contents, :img, :user_id)
    	end
end
