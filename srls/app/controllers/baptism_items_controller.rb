class BaptismItemsController < ApplicationController
  load_and_authorize_resource
  # POST /baptism_items
  # POST /baptism_items.json

def index
    @baptism_items = BaptismItem.all
    @baptism_items = BaptismItem.order(params[:sort])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @baptism_items }
    end
  end

  def create
    @baptism_book = BaptismBook.find(params[:baptism_book_id])
    @baptism_item = @baptism_book.baptism_items.create(params[:baptism_item])
    @baptism_item.user = current_user
    @baptism_item.validado = false
    @baptism_item.save
    #@baptism_item.baptism_book_id = @baptism_book_id
    redirect_to baptism_book_path(@baptism_book)
  end

  def show
    @baptism_item = BaptismItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @baptism_item}
      #format.pdf  { render :layout => false}
    end
  end

# GET /baptism_items/1/edit
  def edit
    @baptism_item = BaptismItem.find(params[:id])
    if @baptism_item.validado
        format.html { redirect_to @baptism_item, notice: 'Validacion ya fue hecha no se puede modificar' }
    end
  end

  def print
    @baptism_item = BaptismItem.find(params[:id])
    render layout: false
  end

  def update
    @baptism_item = BaptismItem.find(params[:id])
    @baptism_item.user = current_user
    respond_to do |format|
      if @baptism_item.update_attributes(params[:baptism_item])
        format.html { redirect_to @baptism_item, notice: 'Partida de Bautizo actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @baptism_item.errors, status: :unprocessable_entity }
      end
    end
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