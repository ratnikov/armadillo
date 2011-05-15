class SessionsController < ApplicationController
  def create
    if user = Session.new(params[:session]).user
      current_user = user

      flash[:success] = translate('session.create.success')
      redirect_back_or root_path
    else
      flash[:failure] = translate('session.create.failure')

      render :action => 'new'
    end
  end
end