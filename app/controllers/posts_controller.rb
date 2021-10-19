class PostsController < ApplicationController

  def index
    @posts = Post.all.page(params[:page]).per(10)
    @random = Keyword.order("RAND()").limit(2)
  end

  def new
    @post = Post.new
    @random = Keyword.order("RAND()").limit(2)
  end

  def create
    
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path
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
