class DeathRecordItemsController < ApplicationController
  # POST /confirmation_items
  # POST /confirmation_items.json
  def create
    @death_record_book = DeathRecordBook.find(params[:death_record_book_id])
    @death_record_item = @death_record_book.death_record_items.create(params[:death_record_item])
    @death_record_item.user = current_user
    @death_record_item.validado = false
    @death_record_item.save
    redirect_to death_record_book_path(@death_record_book)
  end

  # DELETE /confirmation_items/1
  # DELETE /confirmation_items/1.json
  
  def destroy

    @death_record_item= DeathRecordItem.find(params[:id])
    @death_record_item.destroy
    redirect_to death_record_book_path(@death_record_book)
  end 
end
