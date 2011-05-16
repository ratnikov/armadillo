class FiltersController < ApplicationController
  def index
    @filters = current_user.filters
  end

  def create
    @filter = current_user.filters.build params[:filter]

    if @filter.save
      flash[:success] = translate('filter.create.success')

      redirect_to filters_path
    else
      flash[:failure] = translate('filter.create.failure')

      render :action => 'index'
    end
  end
end
