class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/login", notice: "Email or password is incorrect"
    end
  end

  def destroy
    session[:user_id] = nil
    if in_cart?(request.referrer)
      redirect_to "/"
    else
      redirect_to request.referrer
    end
  end

  private

  def in_cart?(url)
    /cart/ === url
  end
end
