    class TweetsController < ApplicationController
   before_action :set_tweet, only: [:show, :edit, :update, :destroy, :authorize]
   before_action :authorize, only:[:edit, :destroy]

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

def authorize
    unless @tweet.user_id == current_user.id 
    flash[:notice] = "You are not the creator of this tweet, therefore you're not permitted to edit or destroy this tweet"
    redirect_to root_path # or anything you prefer
    return false # Important to let rails know that the controller should not be executed
  end
end



  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end


  def tweet_params
    params.require(:tweet).permit(:title, :kontent, :rejting, :user_id)   
  end

end
