class PostsController < ApplicationController

  # この辺はアクティブレコードを勉強してね.
  # orderを以下のように指定することで, 最新順に記事がソートされる.
  def index
    @posts = Post.all.order(created_at: 'desc')
  end

  def show
    # params[:id]は, URLで渡ってくるidのことを指す.
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    #render plain: params[:post].inspect
    # save
    #@post = Post.new(params[:post]) #params[:post]は送られてきたデータ
    @post = Post.new(post_params)
    if @post.save
      # redirect
      redirect_to posts_path
    else
      #render plain: @post.errors.inspect # Error文の表示
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id]) #記事の特定
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
