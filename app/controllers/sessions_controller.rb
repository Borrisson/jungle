class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/login", notice: "Email or password is wrong"
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
