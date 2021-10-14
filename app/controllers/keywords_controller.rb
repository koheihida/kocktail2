class KeywordsController < ApplicationController
    def index
      @keywords = Keyword.all
    end
    
    def new
      @keyword = Keyword.new
    end
  
    def create  
      @keyword = Keyword.create(keyword_params)
       save
    end

    def show
      @keywords = Keyword.all
      @keyword = @keywords.ids.find(params[:id])
    end

    def destroy
      @keywords = Keyword.all
      @keyword = @keywords.find(params[:id])
      @keyword.destroy
      redirect_back(fallback_location: keywords_path)
    end

    
  
    private
  
    def keyword_params
      params.permit(:text, :decoration_id).merge(user_id: current_user.id)
    end  
  
    def save
      if @keyword.save
        redirect_back(fallback_location: keywords_path)
        # redirect_to "http://localhost:3000/kotobas"
     end 
    end
end
