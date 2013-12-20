class ChangeLogsController < ApplicationController
  load_and_authorize_resource
  # GET /change_logs
  # GET /change_logs.json
  def index
    @change_logs = ChangeLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @change_logs }
    end
  end

  # GET /change_logs/1
  # GET /change_logs/1.json
  def show
    @change_log = ChangeLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @change_log }
    end
  end

  # GET /change_logs/new
  # GET /change_logs/new.json
  def new
    @change_log = ChangeLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @change_log }
    end
  end

  # GET /change_logs/1/edit
  def edit
    @change_log = ChangeLog.find(params[:id])
  end

  # POST /change_logs
  # POST /change_logs.json
  def create
    @change_log = ChangeLog.new(params[:change_log])

    respond_to do |format|
      if @change_log.save
        format.html { redirect_to @change_log, notice: 'Log de Cambios Creado con exito.' }
        format.json { render json: @change_log, status: :created, location: @change_log }
      else
        format.html { render action: "new" }
        format.json { render json: @change_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /change_logs/1
  # PUT /change_logs/1.json
  def update
    @change_log = ChangeLog.find(params[:id])

    respond_to do |format|
      if @change_log.update_attributes(params[:change_log])
        format.html { redirect_to @change_log, notice: 'Log de Cambios exitosamente actualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @change_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /change_logs/1
  # DELETE /change_logs/1.json
  def destroy
    @change_log = ChangeLog.find(params[:id])
    @change_log.destroy

    respond_to do |format|
      format.html { redirect_to change_logs_url }
      format.json { head :no_content }
    end
  end
end
