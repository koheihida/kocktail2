class TitlesController < ApplicationController

  def index
    @title = Title.find(params[:id])
  end

  
end
