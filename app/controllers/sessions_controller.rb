class SessionsController < ApplicationController
  skip_before_filter :authorize, :only => [ :new, :create, :destroy ]

  def new
  end

  def create
    if user = Session.new(params[:session]).user
      sign_in user

      flash[:success] = translate('session.create.success')
      redirect_back_or root_path
    else
      flash[:failure] = translate('session.create.failure')

      render :action => 'new'
    end
  end

  def destroy
    sign_out

    flash[:success] = translate('session.destroy.success')

    redirect_back_or root_path
  end
end
