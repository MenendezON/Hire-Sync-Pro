class HomeController < ApplicationController
  layout 'public_layout'
  def index
    @posts = Post.includes(:category).all
  end

  def show
  end
end
