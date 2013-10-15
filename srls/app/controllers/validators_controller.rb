class ValidatorsController < ApplicationController
  load_and_authorize_resource
  # GET /validators
  # GET /validators.json
  def index
    @validators = Validator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @validators }
    end
  end

  # GET /validators/table_index
  # GET /validators/table_index.json
  def table_index
    @validators = Validator.where(tabla: params[:tabla])

    render 'index'
  end

  # GET /validators/pending_index
  # GET /validators/pending_index.json
  def pending_index
    @pendings = datos_no_validados

  end

  private
  #metodo para obtener la tabla
  def datos_no_validados
    case self.tabla
      when "Libro de Bautizo"
        datos = BatismBook.where(validado: false)
      when "Partida de Bautizo"
        datos = BatismItem.where(validado: false)
      when "Libro de Confirmacion"
        datos = ConfirmationBook.where(validado: false)
      when "Partida de Confirmacion"
        datos = ConfirmationItem.where(validado: false)
      when "Libro de Defuncion"
        datos = DeathRecordBook.where(validado: false)
      when "Partida de Defuncion"
        datos = DeathRecordItem.where(validado: false)
      when "Libro de Matrimonio"
        datos = MarriegeBook.where(validado: false)
      when "Partida de Matrimonio"
        datos = MarriegeItem.where(validado: false)
      else
        datos = nil
    end
    return datos
  end

  public
  # GET /validators/1
  # GET /validators/1.json
  def show
    @validator = Validator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @validator }
    end
  end

  # GET /validators/new
  # GET /validators/new.json
  def new
    @validator = Validator.new
    dato = params[:dato].split('&')
    @validator.tabla = dato[0]
    @validator.id_dato = dato[1]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @validator }
    end
  end

  # GET /validators/1/edit
  def edit
    @validator = Validator.find(params[:id])
  end

  # POST /validators
  # POST /validators.json
  def create
    @validator = Validator.new(params[:validator])
    
    respond_to do |format|
      if @validator.save
        format.html { redirect_to @validator, notice: 'Validator was successfully created.' }
        format.json { render json: @validator, status: :created, location: @validator }
      else
        format.html { render action: "new" }
        format.json { render json: @validator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /validators/1
  # PUT /validators/1.json
  def update
    @validator = Validator.find(params[:id])

    respond_to do |format|
      if @validator.update_attributes(params[:validator])
        format.html { redirect_to @validator, notice: 'Validator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @validator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /validators/1
  # DELETE /validators/1.json
  def validar
    parametros = params[:dato].split('&')
    validator = Validator.new
    validator.tabla = parametros[0]
    validator.id_dato = parametros[1]
    @dato = validator.dato
    @dato.validado = true
    @dato.save

    respond_to do |format|
      format.html { redirect_to validators_url }
      format.json { head :no_content }
    end
  end

  # DELETE /validators/1
  # DELETE /validators/1.json
  def destroy
    @validator = Validator.find(params[:id])
    @validator.destroy

    respond_to do |format|
      format.html { redirect_to validators_url }
      format.json { head :no_content }
    end
  end
end
