class DeathRecordItemsController < ApplicationController
  load_and_authorize_resource
  # POST /death_record_items
  # POST /death_record_items.json
  def index
    @death_record_items = DeathRecordItem.all
    @death_record_items = DeathRecordItem.order(params[:sort])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @death_record_items }
    end
  end

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
      #format.pdf  { render :layout => false}
    end
  end

  # GET /death_record_items/1/edit
  def edit
    @death_record_item = DeathRecordItem.find(params[:id])
    if @death_record_item.validado
        format.html { redirect_to @death_record_item, notice: 'Validacion ya fue hecha no se puede modificar' }
    end
  end

  def print
    @death_record_item = DeathRecordItem.find(params[:id])
    render layout: false
  end

  def update
    @death_record_item = DeathRecordItem.find(params[:id])
    @death_record_item.user = current_user
    respond_to do |format|
      if @death_record_item.update_attributes(params[:death_record_item])
        format.html { redirect_to @death_record_item, notice: 'Partida de Defuncion actualizada exitosamente.' }
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
