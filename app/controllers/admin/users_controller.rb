class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:update]
    before_action :authenticate_user!
    before_action :authorize_admin!
    skip_before_action :verify_authenticity_token

    layout 'admin'

    def index
      @users = User.all.where(company: current_user.company)
      @user = User.new
      @company = current_user.company.name
    end
  
    def show
    end
  
    def create
      @user = User.new(user_params)
      @user.company = current_user.company
      if @user.save
        redirect_to admin_users_path, notice: 'User created'
      else
        redirect_to admin_users_path, alert: 'Unable to create user'
      end  
    end
  
    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User updated'
      else
        redirect_to admin_users_path, alert: 'Unable to update user'
      end  
    end
  
    private
  
    def authorize_admin!
      redirect_to root_path, alert: 'Access Denied' unless current_user.admin? || current_user.moderator?
    end
  
    def user_params
      params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :role)
    end
  
    def set_user
      @user = User.find(params[:id])
    end
end
