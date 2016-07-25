# controller for activation
class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activate? && user.authenticated?(:activation, params[:id])
      user.activate
      log_user user
      flash[:success] = 'Account activated!'
      redirect_to user
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end
end
