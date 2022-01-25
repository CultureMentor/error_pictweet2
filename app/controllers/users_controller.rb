class UsersController < ApplicationController
  def show
    users = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets
  end
end
