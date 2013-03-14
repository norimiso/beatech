# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  def index
    @title = "メンバー紹介"
    
    @users_0th = User.grade(0)
    @users_1st = User.grade(1)
    @users_2nd = User.grade(2)
    @users_3rd = User.grade(3)
    @users_4th = User.grade(4)
    @users_ob  = User.ob
  end

  def show
    @user = User.find_by_account(params[:account])
    raise Forbidden unless @user
    @title = User.name_by_account(params[:account]) + "のプロフィール"
  end
  
  def edit
    @user = User.find_by_account(params[:account])
    raise Forbidden unless @user
    @title = User.name_by_account(params[:account]) + "のプロフィールの編集"
  end
  
  def update
    @user = User.find(params[:account])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to root_url + 'users/' + @user.account, :notice => 'User was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    admin_required

    @user = User.find_by_account(params[:account])
    raise Forbidden unless @user
    @user.destroy
    redirect_to root_url + 'users'
  end
  
  def new
    @user = User.new
    @title = "入部申請"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  def editprofile
    @user = User.find_by_account(session[:account])
    @title = "プロフィール編集"
  end

  def editpassword
    @user = User.find_by_account(session[:account])
    @title = "パスワード変更"
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update_password
    @user = User.find_by_account(session[:account])
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to root_url + "settings/password", :notice => "パスワードが確認用パスワードと一致しません。"
      return
    end
    @user.password_digest = BCrypt::Password.create(params[:user][:password])
    @user.save!
    redirect_to root_url + "settings/password", :notice => "パスワードを変更しました。"
  end
  
  def update_profile
    @user = User.find_by_account(session[:account])
    @user.name = params[:user][:name]
    @user.profile = params[:user][:profile]
    @user.save!
    redirect_to root_url + "settings/profile", :notice => "プロフィールを変更しました。"
  end

  def create_user
    @user = User.create(params[:user])
    session[:account] = @user.account

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
