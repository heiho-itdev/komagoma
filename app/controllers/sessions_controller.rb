class SessionsController < ApplicationController
  skip_before_action :check_logged_in, only: :create

  def create
    logger.debug("SessionsController.create")
    if (user = User.find_or_create_from_auth_hash(auth_hash))
      logger.debug("----------------------------------------------------------")
      logger.debug("user = User.find_or_create_from_auth_hash(auth_hash)がtrue")
      logger.debug(user)
      logger.debug("----------------------------------------------------------")
      log_in user
    end
    logger.debug("-----------------redirect_to root_pathしますー------------------------")
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
