class UserLogsController < ApplicationController
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
      format.html # index.html.erb
      format.json { render json: @user_logs }
    end
  end
end
