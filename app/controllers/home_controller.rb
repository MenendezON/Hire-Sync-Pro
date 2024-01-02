class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'public_layout'
  def index
    @posts = Post.includes(:category).all
  end

  def show
  end
end
