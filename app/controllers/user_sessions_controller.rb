class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path, notice: "ログインしました。"
    else
      flash.now[:alert] = "ログインできませんでした。"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_path, status: :see_other, notice: "ログアウトしました。"
  end
end