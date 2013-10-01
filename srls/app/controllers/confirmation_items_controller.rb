class ConfirmationItemsController < ApplicationController
    # POST /confirmation_items
  # POST /confirmation_items.json
  def create
    @confirmation_book = ConfirmationBook.find(params[:confirmation_book_id])
    @confirmation_item = @confirmation_book.confirmation_items.create(params[:confirmation_item])
    @confirmation_item.user = current_user
    @confirmation_item.validado = false
    @confirmation_item.save
    redirect_to confirmation_book_path(@confirmation_book)
  end

  # DELETE /confirmation_items/1
  # DELETE /confirmation_items/1.json
  
  def destroy

    @confirmation_item= ConfirmationItem.find(params[:id])
    @confirmation_item.destroy
    redirect_to confirmation_book_path(@confirmation_book)
  end 
end
