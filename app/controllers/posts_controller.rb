class PostsController < ApplicationController
  before_action :login?
  before_action :count_pv , only: [:show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @pv_num = pv_num
  end

  def new
    @post = current_user.posts.new
  end

  def edit

  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to posts_index_path
    else
      p @post.errors
      render "new"
    end
  end

  private
    # def test_action
      # p "test"
    # end
    def pv_num
      $redis.get("pv_post#{params[:id]}_#{Time.now.to_date.iso8601}")
    end

    def count_pv
      $redis.incr("pv_post#{params[:id]}_#{Time.now.to_date.iso8601}")
    end

    def login?
      redirect_to login_path, flash: { login_error: "ログインしてください" } unless current_user
    end

    def posts_params
      params.require(:post).permit(:title, :content)
    end
end
