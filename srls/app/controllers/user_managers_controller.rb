class UserManagersController < ApplicationController
  # GET /user_managers
  # GET /user_managers.json
  def index
    @users = User.all
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
    role = (params[:role]).to_i
    #role = User.new(params[:user]).role
    if @user.role == 2 && role !=2
      functionary = FuncionaryRestaurant.where(:user_id => params[:id])
      functionary.each do |aux|
        aux.destroy
      end
    end
    @user.role = role
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
