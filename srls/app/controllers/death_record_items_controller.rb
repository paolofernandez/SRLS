class DeathRecordItemsController < ApplicationController
  # POST /death_record_items
  # POST /death_record_items.json
  def create
    @death_record_book = DeathRecordBook.find(params[:death_record_book_id])
    @death_record_item = @death_record_book.death_record_items.create(params[:death_record_item])
    @death_record_item.user = current_user
    @death_record_item.validado = false
    @death_record_item.save
    redirect_to death_record_book_path(@death_record_book)
  end

  def show
    @death_record_item = DeathRecordItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @death_record_item}
    end
  end

  # GET /death_record_items/1/edit
  def edit
    @death_record_item = DeathRecordItem.find(params[:id])
  end

  def update
    @death_record_item = DeathRecordItem.find(params[:id])
    @death_record_item.user = current_user
    respond_to do |format|
      if @death_record_item.update_attributes(params[:death_record_item])
        format.html { redirect_to @death_record_item, notice: 'Marriege book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @death_record_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /death_record_items/1
  # DELETE /death_record_items/1.json
  
  def destroy

    @death_record_item= DeathRecordItem.find(params[:id])
    @death_record_item.destroy
    redirect_to death_record_book_path(@death_record_book)
  end 
end
