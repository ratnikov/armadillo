class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [ :new, :create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]

    if @user.save
      sign_in @user
      flash[:success] = translate('user.create.success')

      redirect_to root_path
    else
      flash[:failure] = translate('user.create.failure')

      render :action => 'new'
    end
  end
end
