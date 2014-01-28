class MarriegeItemsController < ApplicationController
  load_and_authorize_resource

  def index
    @marriege_items = MarriegeItem.all
    @marriege_items = MarriegeItem.order(params[:sort])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @marriege_items }
    end
  end
  
   def create
    @marriege_book = MarriegeBook.find(params[:marriege_book_id])
    @marriege_item = @marriege_book.marriege_items.create(params[:marriege_item])
    @marriege_item.user = current_user
    @marriege_item.validado = false
    @marriege_item.save
    redirect_to marriege_book_path(@marriege_book)
  end


  # GET /marriege_items/1/edit
  def edit
    @marriege_item = MarriegeItem.find(params[:id])
    if @marriege_item.validado
        format.html { redirect_to @marriege_item, notice: 'Validacion ya fue hecha no se puede modificar' }
    end
  end

     def show
    @marriege_item = MarriegeItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marriege_item}
      #format.pdf  { render :layout => false}
    end
  end

  def print
    @marriege_item = MarriegeItem.find(params[:id])
    render layout: false
  end

  def update
    @marriege_item = MarriegeItem.find(params[:id])
    @marriege_item.user = current_user
    respond_to do |format|
      if @marriege_item.update_attributes(params[:marriege_item])
        format.html { redirect_to @marriege_item, notice: 'Partida de Matrimonio actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @marriege_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confirmation_items/1
  # DELETE /confirmation_items/1.json
  
  def destroy

    @marriege_item= DeathRecordItem.find(params[:id])
    @marriege_item.destroy
    redirect_to marriege_book_path(@marriege_book)
  end 
end
