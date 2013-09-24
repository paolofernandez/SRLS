class BaptismItemsController < ApplicationController

  # POST /baptism_items
  # POST /baptism_items.json
  def create
    @baptism_book = BaptismBook.find(params[:baptism_book_id])
    @baptism_item = @baptism_book.baptism_items.create(params[:baptism_item])
    @baptism_item.user = current_user
    @baptism_item.validado = false
    @baptism_item.save
    #@baptism_item.baptism_book_id = @baptism_book_id
    redirect_to baptism_book_path(@baptism_book)
  end

  # DELETE /baptism_items/1
  # DELETE /baptism_items/1.json
  
  def destroy

    @baptism_item= BaptismItem.find(params[:id])
    @baptism_item.destroy
      #@baptism_book = baptism_book.find(params[:baptism_book_id])
      #@baptism_item = @baptism_book.baptism_items.find(params[:id])
      #@baptism_item.destroy
    redirect_to baptism_book_path(@baptism_book)
  end 
end