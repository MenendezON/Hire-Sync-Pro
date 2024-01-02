class PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]

  layout 'public_layout'

  def index
    redirect_to root_path
  end

  def show
  end

  private
  
  def set_post
    @post = Post.includes(:category).find(params[:id])
  end

end