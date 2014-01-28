class UserLogsController < ApplicationController
  #load_and_authorize_resource
  # GET /user_logs
  # GET /user_logs.json
  def index
    @user_logs = UserLog.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_logs }
    end
  end

  def user_logs_index
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # user_logs_index.html.erb
      format.json { render json: @user }
    end
  end
  
  def cerrar_sesion
    mis_logs = UserLog.where(:user_id => current_user.id, :entrada => current_user.current_sign_in_at)
    if mis_logs != nil && mis_logs != []
      if mis_logs[0].salida == nil
        mis_logs[0].salida = DateTime.now
        mis_logs[0].save
      end
    end
    redirect_to destroy_user_session_path, :method => :delete
  end
  
  def changes_index
    @changes = UpdatedDataTable.all

    respond_to do |format|
      format.html # changes_index.html.erb
      format.json { render json: @changes }
    end
  end
  
  def user_changes_index
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # user_changes_index.html.erb
      format.json { render json: @user }
    end
  end

  def show_change_information
    @change = UpdatedDataTable.find(params[:id])

    respond_to do |format|
      format.html # show_change_information.html.erb
      format.json { render json: @change }
    end
  end
end
