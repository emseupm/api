class Api::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def me
    respond_with current_user
  end
end
