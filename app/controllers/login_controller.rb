class LoginController < ApplicationController
  skip_before_action :check_logged_in

  layout 'clear'
  def index
    logger.debug("LoginController.index")
    logger.debug(params)
    render"login/index"
  end
  def show
    render"login/index"
  end
end
