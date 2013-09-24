class BaptismItemsController < ApplicationController

  # POST /baptism_items
  # POST /baptism_items.json
  def create
    @baptism_book = baptism_book.find(params[:baptism_book_id])
    @baptism_item = @baptism_book.baptism_items.create(params[:baptism_item])
    redirect_to baptism_book_path(@baptism_book)
  end

  # DELETE /baptism_items/1
  # DELETE /baptism_items/1.json
  
def destroy
    @baptism_book = baptism_book.find(params[:baptism_book_id])
    @baptism_item = @baptism_book.baptism_items.find(params[:id])
    @baptism_item.destroy
    redirect_to baptism_book_path(@baptism_book)
  end






  # GET /baptism_items
  # GET /baptism_items.json
  def index
    @baptism_items = BaptismItem.all
    @baptism_items = BaptismItem.order(params[:sort])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @baptism_items }
    end
  end

  # GET /baptism_items/1
  # GET /baptism_items/1.json
  def show
    @baptism_item = BaptismItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @baptism_item }
    end
  end

  # GET /baptism_items/new
  # GET /baptism_items/new.json
  def new
    @baptism_item = BaptismItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @baptism_item }
    end
  end

  # GET /baptism_items/1/edit
  def edit
    @baptism_item = BaptismItem.find(params[:id])
  end

 

  # PUT /baptism_items/1
  # PUT /baptism_items/1.json
  def update
    @baptism_item = BaptismItem.find(params[:id])

    respond_to do |format|
      if @baptism_item.update_attributes(params[:baptism_item])
        format.html { redirect_to @baptism_item, notice: 'Baptism item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @baptism_item.errors, status: :unprocessable_entity }
      end
    end
  end

  
end
