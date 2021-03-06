class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new(item_params)
    if @item.save
      flash[:notice] = "new item was created."
      redirect_to @user
    else
      flash[:error] = "There was an error saving the item. Please try again."
      redirect_to @user
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @user = @item.user
    if @item.destroy
      flash[:notice] = "item was deleted."
      #redirect_to @user
    else
      flash[:error] = "There was an error deleting the item. Please try again."
      #redirect_to @user
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name)
  end
end
