class SessionsController < ApplicationController
  def new
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "ログアウトしました。"
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to posts_index_path, notice: "ログインしました。"
    else
      flash[:danger] = "invalid email or password"
      render "new"
    end
  end

  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
