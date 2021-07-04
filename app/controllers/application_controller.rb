class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :check_logged_in

  def check_logged_in
    logger.debug("ApplicationController.check_logged_in")
    if current_user
      logger.debug("is current_user")
    else
      logger.debug("is unless current_user to login")
      redirect_to :controller => :login, action: :index
    end
  end
end
