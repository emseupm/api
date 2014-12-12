class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :setup_cors

  private

  def setup_cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def authenticate_admin_user!
      raise SecurityError unless current_user.admin?
  end

  def current_admin_user
    current_user.admin?
  end

  rescue_from SecurityError do |exception|
    render body: "Forbidden", status: 403
  end


end
