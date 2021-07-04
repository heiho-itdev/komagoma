class SessionsController < ApplicationController
  skip_before_action :check_logged_in, only: :create

  def create
    logger.debug("SessionsController.create")
    logger.debug(auth_hash)
    if (user = User.find_or_create_from_auth_hash(auth_hash))
      log_in user
    end
    redirect_to root_path
  end

  def destroy
    logger.debug("SessionsController.destroy")
    log_out
    redirect_to root_path
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
