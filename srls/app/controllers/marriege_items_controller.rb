class MarriegeItemsController < ApplicationController
  # GET /marriege_items
  # GET /marriege_items.json
  def index
    @marriege_items = MarriegeItem.all
    @marriege_items = MarriegeItem.order(params[:sort])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @marriege_items }
    end
  end

  # GET /marriege_items/1
  # GET /marriege_items/1.json
  def show
    @marriege_item = MarriegeItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marriege_item }
    end
  end

  # GET /marriege_items/new
  # GET /marriege_items/new.json
  def new
    @marriege_item = MarriegeItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marriege_item }
    end
  end

  # GET /marriege_items/1/edit
  def edit
    @marriege_item = MarriegeItem.find(params[:id])
  end

  # POST /marriege_items
  # POST /marriege_items.json
  def create
    @marriege_item = MarriegeItem.new(params[:marriege_item])

    respond_to do |format|
      if @marriege_item.save
        format.html { redirect_to @marriege_item, notice: 'Marriege item was successfully created.' }
        format.json { render json: @marriege_item, status: :created, location: @marriege_item }
      else
        format.html { render action: "new" }
        format.json { render json: @marriege_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /marriege_items/1
  # PUT /marriege_items/1.json
  def update
    @marriege_item = MarriegeItem.find(params[:id])

    respond_to do |format|
      if @marriege_item.update_attributes(params[:marriege_item])
        format.html { redirect_to @marriege_item, notice: 'Marriege item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @marriege_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marriege_items/1
  # DELETE /marriege_items/1.json
  def destroy
    @marriege_item = MarriegeItem.find(params[:id])
    @marriege_item.destroy

    respond_to do |format|
      format.html { redirect_to marriege_items_url }
      format.json { head :no_content }
    end
  end
end
