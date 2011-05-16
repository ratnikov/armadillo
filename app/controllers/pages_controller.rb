class PagesController < ApplicationController
  skip_before_filter :authorize, :only => [ :show ]

  def show
    render :action => params[:id]
  end
end
