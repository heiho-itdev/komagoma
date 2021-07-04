module SessionsHelper

  def current_user
    logger.debug("SessionsHelper.current_user")
    logger.debug(session[:user_id])
    return unless (user_id = session[:user_id])
    @current_user ||= User.find_by(id: user_id)
  end

  def log_in(user)
    logger.debug("SessionsHelper.log_in")
    session[:user_id] = user.id
    logger.debug(session[:user_id])
  end

  def log_out
    logger.debug("SessionsHelper.log_out")
    session.delete(:user_id)
    @current_user = nil
  end
end
