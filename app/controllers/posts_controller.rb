class PostsController < ApplicationController
  before_action :set_post, only: %i[ update destroy ]
  before_action :find_post, only: [:show]
  # GET /posts
  def index
    @posts = Post.includes(:category).all

    render json: @posts.to_json(include: { category: {} })
  end

  # GET /posts/1
  def show
    render json: @post.to_json(include: { category: {} })
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
  end

  private
    def find_post
      @post = Post.includes(:category).find_by(slug: params[:slug])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.includes(:category).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.fetch(:post, {})
    end
end
