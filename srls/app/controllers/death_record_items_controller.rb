class DeathRecordItemsController < ApplicationController
  # GET /death_record_items
  # GET /death_record_items.json
  def index
    @death_record_items = DeathRecordItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @death_record_items }
    end
  end

  # GET /death_record_items/1
  # GET /death_record_items/1.json
  def show
    @death_record_item = DeathRecordItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @death_record_item }
    end
  end

  # GET /death_record_items/new
  # GET /death_record_items/new.json
  def new
    @death_record_item = DeathRecordItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @death_record_item }
    end
  end

  # GET /death_record_items/1/edit
  def edit
    @death_record_item = DeathRecordItem.find(params[:id])
  end

  # POST /death_record_items
  # POST /death_record_items.json
  def create
    @death_record_item = DeathRecordItem.new(params[:death_record_item])

    respond_to do |format|
      if @death_record_item.save
        format.html { redirect_to @death_record_item, notice: 'Death record item was successfully created.' }
        format.json { render json: @death_record_item, status: :created, location: @death_record_item }
      else
        format.html { render action: "new" }
        format.json { render json: @death_record_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /death_record_items/1
  # PUT /death_record_items/1.json
  def update
    @death_record_item = DeathRecordItem.find(params[:id])

    respond_to do |format|
      if @death_record_item.update_attributes(params[:death_record_item])
        format.html { redirect_to @death_record_item, notice: 'Death record item was successfully updated.' }
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
    @death_record_item = DeathRecordItem.find(params[:id])
    @death_record_item.destroy

    respond_to do |format|
      format.html { redirect_to death_record_items_url }
      format.json { head :no_content }
    end
  end
end
