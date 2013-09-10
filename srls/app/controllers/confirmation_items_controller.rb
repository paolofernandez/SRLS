class ConfirmationItemsController < ApplicationController
  # GET /confirmation_items
  # GET /confirmation_items.json
  def index
    @confirmation_items = ConfirmationItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @confirmation_items }
    end
  end

  # GET /confirmation_items/1
  # GET /confirmation_items/1.json
  def show
    @confirmation_item = ConfirmationItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @confirmation_item }
    end
  end

  # GET /confirmation_items/new
  # GET /confirmation_items/new.json
  def new
    @confirmation_item = ConfirmationItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @confirmation_item }
    end
  end

  # GET /confirmation_items/1/edit
  def edit
    @confirmation_item = ConfirmationItem.find(params[:id])
  end

  # POST /confirmation_items
  # POST /confirmation_items.json
  def create
    @confirmation_item = ConfirmationItem.new(params[:confirmation_item])

    respond_to do |format|
      if @confirmation_item.save
        format.html { redirect_to @confirmation_item, notice: 'Confirmation item was successfully created.' }
        format.json { render json: @confirmation_item, status: :created, location: @confirmation_item }
      else
        format.html { render action: "new" }
        format.json { render json: @confirmation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /confirmation_items/1
  # PUT /confirmation_items/1.json
  def update
    @confirmation_item = ConfirmationItem.find(params[:id])

    respond_to do |format|
      if @confirmation_item.update_attributes(params[:confirmation_item])
        format.html { redirect_to @confirmation_item, notice: 'Confirmation item was successfully updated.' }
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
    @confirmation_item = ConfirmationItem.find(params[:id])
    @confirmation_item.destroy

    respond_to do |format|
      format.html { redirect_to confirmation_items_url }
      format.json { head :no_content }
    end
  end
end
