class MarriegeItemsController < ApplicationController
   def create
    @marriege_book = MarriegeBook.find(params[:marriege_book_id])
    @marriege_item = @marriege_book.marriege_items.create(params[:marriege_item])
    @marriege_item.user = current_user
    @marriege_item.validado = false
    @marriege_item.save
    redirect_to marriege_book_path(@marriege_book)
  end

  # DELETE /confirmation_items/1
  # DELETE /confirmation_items/1.json
  
  def destroy

    @marriege_item= DeathRecordItem.find(params[:id])
    @marriege_item.destroy
    redirect_to marriege_book_path(@marriege_book)
  end 
end
