class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:two_factor_code]
 
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def two_factor_code
   binding.pry 
  end

end
