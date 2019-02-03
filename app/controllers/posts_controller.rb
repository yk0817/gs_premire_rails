class PostsController < ApplicationController
  # before_action :test_action, only: [:index]
  before_action :login?

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit

  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to posts_index_path
    else
      render "new"
    end
  end

  private
    # def test_action
      # p "test"
    # end

    def login?
      redirect_to login_path, flash: { login_error: "ログインしてください" } unless current_user
    end

    def posts_params
      params.require(:post).permit(:title, :content)
    end
end
