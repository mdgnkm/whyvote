class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout =>false)
      return
    end
  end
end
