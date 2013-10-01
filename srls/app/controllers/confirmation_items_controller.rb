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

  def show
    @confirmation_item = ConfirmationItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @confirmation_item}
    end
  end
# GET /confirmation_items/1/edit
  def edit

    @confirmation_item = ConfirmationItem.find(params[:id])
  end

  def update
    @confirmation_item = ConfirmationItem.find(params[:id])

    respond_to do |format|
      if @confirmation_item.update_attributes(params[:confirmation_item])
        format.html { redirect_to @confirmation_item, notice: 'Confirmation Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @confirmation_item.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /confirmation_items/1
  # DELETE /confirmation_items/1.json
  
  def destroy

    @confirmation_item= ConfirmationItem.find(params[:id])
    @confirmation_item.destroy
    redirect_to confirmation_book_path(@confirmation_book)
  end 
end
