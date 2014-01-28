class ConfirmationItemsController < ApplicationController
  load_and_authorize_resource
  # POST /confirmation_items
  # POST /confirmation_items.json
  def index
    @confirmation_items = ConfirmationItem.all
    @confirmation_items = ConfirmationItem.order(params[:sort])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @confirmation_items }
    end
  end
  
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
      #format.pdf  { render :layout => false}
    end
  end
# GET /confirmation_items/1/edit
  def edit
    @confirmation_item = ConfirmationItem.find(params[:id])
    if @confirmation_item.validado
        format.html { redirect_to @confirmation_item, notice: 'Validacion ya fue hecha no se puede modificar' }
    end
  end

  def print
    @confirmation_item = ConfirmationItem.find(params[:id])
    render layout: false
  end

  def update
    @confirmation_item = ConfirmationItem.find(params[:id])
    @confirmation_item.user = current_user
    respond_to do |format|
      if @confirmation_item.update_attributes(params[:confirmation_item])
        format.html { redirect_to @confirmation_item, notice: 'Partida de Confirmacion Actualizada exitosamente.' }
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
