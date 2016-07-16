# controller for sessions
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      _log_in user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def _log_in(user)
    log_in user
    params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    redirect_back_or user
  end
end
