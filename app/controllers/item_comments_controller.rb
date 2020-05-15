class ItemCommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]

	def create
	@item = Item.find(params[:item_id])
    @item_comment = @item.item_comments.build(item_comment_params)
    @item_comment.user_id = current_user.id
    @item_comment.item_id = @item.id
    @item_comment.save
    redirect_to item_path(@item)
	end

  def destroy
  	@item = Item.find(params[:item_id])
    @item_comment = ItemComment.find(params[:id])
    @item_comment.destroy
    redirect_back(fallback_location: root_path)
  end

  def correct_user
    @item_comment = ItemComment.find(params[:id])
  end

	private
		def item_comment_params
    	params.require(:item_comment).permit(:comment)
		end
end
