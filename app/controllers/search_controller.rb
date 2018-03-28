class SearchController < ApplicationController

  def index
    @stations = NPresenter.new(params[:q])
  end

end
