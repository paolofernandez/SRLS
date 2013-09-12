class UserManagersController < ApplicationController
  # GET /user_managers
  # GET /user_managers.json
  def index
    @users = User.all
    @users = User.order(params[:sort])
  end
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @baptism_book }
    end
  end

def home
end

  def create
    @user = User.new
    @user.email = params[:email]
    @user.rol = params[:rol]
    @user.password = params[:password]
    @user.password_confirmation = params[:confirm]
    if @user.password == @user.password_confirmation
      @user.save
      redirect_to :action => 'index'
    else
      redirect_to :action => 'edit_password'
    end
  end  
  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :action => 'index'
  end
  def edit
    @user = User.find(params[:id])
  end
  def changeRole
    @user = User.find(params[:id])
    rol = (params[:rol]).to_i
    #rol = User.new(params[:user]).rol
    if @user.rol == 2 && rol !=2
      functionary = FuncionaryRestaurant.where(:user_id => params[:id])
      functionary.each do |aux|
        aux.destroy
      end
    end
    @user.rol = rol
    @user.save
    redirect_to :action => 'index'
  end
  def edit_password
    @user = User.find(params[:id])
  end
  def change_password
    @user = User.find(params[:id])
    @user.password = params[:password]
    @user.password_confirmation = params[:confirm]
    if @user.password == @user.password_confirmation
      @user.save
      redirect_to :action => 'index'
    else
      redirect_to :action => 'edit_password'
    end
  end
end
