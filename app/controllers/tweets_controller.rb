    class TweetsController < ApplicationController
   before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets=Tweet.all
  end

  def show
    # binding.pry pAuza
  end

  def new
    @tweet=Tweet.new
  end

  def edit; end


  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html {redirect_to @tweet}  #nie ma notice
      else
        format.html {render :edit}
      end
    end
  end


  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html {redirect_to @tweet}  #nie ma notice
      else 
        format.html {render :edit}
      end
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bootstrap 
    @user = User.first
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end


  def tweet_params
    params.require(:tweet).permit(:title, :kontent, :rejting, :user_id)
  end

end
