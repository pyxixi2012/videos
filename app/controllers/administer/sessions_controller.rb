class Administer::SessionsController < ApplicationController
  layout 'just_admin_sign'

  def admin_sign_in
  end

  def admin_sign_login
    if params[:account].blank? || params[:password].blank?
      flash[:notice] = '账号密码不能为空'
      redirect_to admin_sign_in_path
    else
      if params[:account] == Settings.account
        if params[:password] == Settings.password
          session[:admin] = 1
          flash[:success] = '欢迎回来、数据管理员'
          redirect_to dashboard_path
        else
          flash[:notice] = '管理员密码有误'
          redirect_to admin_sign_in_path
        end
      else
        flash[:notice] = '账户不存在'
        redirect_to admin_sign_in_path
      end
    end
  end

  def admin_sign_out
    session[:admin] = nil
    redirect_to root_path
  end

end
