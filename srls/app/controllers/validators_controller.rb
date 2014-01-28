class ValidatorsController < ApplicationController
  load_and_authorize_resource
  # GET /validators
  # GET /validators.json
  def index
    @validators = Validator.all
    @validators = Validator.paginate(page: params[:page])
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

  # GET /validators/not_valid_index
  # GET /validators/not_valid_index.json
  def not_valid_index
    @validators = Validator.where(tabla: params[:tabla], valido: false)

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
    case params[:tabla]
      when "baptism_books"
        datos = BaptismBook.where(validado: false)
      when "baptism_items"
        datos = BaptismItem.where(validado: false)
      when "confirmation_books"
        datos = ConfirmationBook.where(validado: false)
      when "confirmation_items"
        datos = ConfirmationItem.where(validado: false)
      when "death_record_books"
        datos = DeathRecordBook.where(validado: false)
      when "death_record_items"
        datos = DeathRecordItem.where(validado: false)
      when "marriege_books"
        datos = MarriegeBook.where(validado: false)
      when "marriege_items"
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
    @validator.user = current_user
    if @validator.valido
      validar(@validator.tabla, @validator.id_dato)
    end
    
    respond_to do |format|
      if @validator.save
        format.html { redirect_to @validator, notice: 'Validacion fue creada exitosamente.' }
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
        format.html { redirect_to @validator, notice: 'Validacion fue modificada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @validator.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def validar(tabla, id_dato)
    @dato = buscar_dato(tabla, id_dato)
    @dato.validado = true
    @dato.save
  end

  def buscar_dato(tabla,id_dato)
    case tabla
      when "Libro de Bautizo"
        dato = BaptismBook.find(id_dato)
      when "Partida de Bautizo"
        dato = BaptismItem.find(id_dato)
      when "Libro de Confirmacion"
        dato = ConfirmationBook.find(id_dato)
      when "Partida de Confirmacion"
        dato = ConfirmationItem.find(id_dato)
      when "Libro de Defuncion"
        dato = DeathRecordBook.find(id_dato)
      when "Partida de Defuncion"
        dato = DeathRecordItem.find(id_dato)
      when "Libro de Matrimonio"
        dato = MarriegeBook.find(id_dato)
      when "Partida de Matrimonio"
        dato = MarriegeItem.find(id_dato)
    end
    dato
  end

  public

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
