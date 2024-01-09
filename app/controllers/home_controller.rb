class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'public'
  
  def index
    @posts = Post.includes(:category).where(available: true).order(created_at: :desc)
  end

  def show
  end
end
