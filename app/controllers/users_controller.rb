class UsersController < ApplicationController
  def new
    @user = User.new
    #あってもなくても良い。
    render :new
  end

  def create
    @user = User.new(user_params)
    # @user.saveで成功 → true
    # ゛で不成功 → false
    if @user.save
      flash[:success] = "登録が出来ました。"
      redirect_to posts_index_path
    else
      render :new, notice: "登録出来ませんでした。"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :self_introduction, :email, :password, :password_confirmation)
    end
end
