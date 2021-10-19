module PostsHelper
  def titles
    @random = Keyword.order("RAND()").limit(2)
    @add = []
    @random.each do |book|
      @add << book.text
    end
  end
end 

