class KeywordsController < ApplicationController
    def index
      @keywords = Keyword.all.page(params[:page]).per(25).order("created_at DESC")
    end
    
    def search
      @keywords = Keyword.search(params[:keyword])
    end

    def new
      @keyword = Keyword.new
    end
  
    def create  
      @keyword = Keyword.new(keyword_params)
      if @keyword.save
        redirect_to  keywords_path
      else
        render :new  
      end 
    end

    def show
      @keywords = Keyword.all
      # @keyword = @keywords.find_by(params[:id])
      # @keyword = []
      # @keywords.each do |document|
      #   keyword_id = Keyword.where(params[:id])
      #   @keyword << keyword_id
      # end
      # @keywords =  Keyword.all.ids
      # @keyword = @keywords.ids.find(params[:id])
    end

    def destroy
      @keywords = Keyword.all
      @keyword = @keywords.find(params[:id])
      @keyword.destroy
      redirect_back(fallback_location: keywords_path)
    end

    private
  
    def keyword_params
      params.permit(:text).merge(user_id: current_user.id)
    end  
end
