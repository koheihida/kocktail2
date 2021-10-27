class PostsController < ApplicationController

  def index
    @posts = Post.all.page(params[:page]).per(10).order("created_at DESC")
    @random = Keyword.order("RAND()").limit(2)
  end

  def search
    @posts = Post.search(params[:keyword])
    
  end

  def new
    @post = Post.new(post_params)
    @random = Keyword.order("RAND()").limit(2)
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  private

  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end

  def titles
    @random = Keyword.order("RAND()").limit(2)
    @random.each do |book|
      book.text
    end
  end
end
