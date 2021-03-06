class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :search]
  
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    Tweet.create(tweet_params)
  end
  
  def show
    @comment = Comment.new
    @comments = @tweets.comments.includes(:user)
  end
  
  def edit
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end
  
  def search
    @tweets = Tweet.search(params[:keyword])
  end
  
  private  # private以下の記述はすべてプライベートメソッドになる

  def tweet_params  # プライベートメソッド
    params.require(:tweet).permit(:images, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
