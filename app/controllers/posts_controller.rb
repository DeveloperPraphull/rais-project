class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user_not_blocked, only: [:new, :create]
  def index
    @posts = Post.all
  end

  def show
    @post =  current_user.posts.find(params[:id])
  end

  def new
  
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
  
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def ensure_user_not_blocked
    redirect_to root_path, alert: "You are blocked from creating posts." if current_user.blocked?
  end
  
  def post_params
    params.require(:post).permit(:title, :content)
  end


end
