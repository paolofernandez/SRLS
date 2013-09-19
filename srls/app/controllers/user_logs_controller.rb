class UserLogsController < Devise::SessionsController
  # GET /user_logs
  # GET /user_logs.json
  def index
    @user_logs = UserLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_logs }
    end
  end
  
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    sesion = UserLog.create(user_id: current_user.id, entrada: current_user.current_sign_in_at)
    respond_with resource, :location => after_sign_in_path_for(resource)
  end

  def user_logs_index
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_logs }
    end
  end
end
