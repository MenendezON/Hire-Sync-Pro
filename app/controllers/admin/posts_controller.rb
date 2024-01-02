class Admin::PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.includes(:category).all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_posts_path, notice: 'Post created successfully.'
    else
      render 'new'
    end
  end

    # PATCH/PUT /posts/1 or /posts/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to admin_post_url(@post), notice: "Post was successfully updated." }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
  end
  
    # DELETE /posts/1 or /posts/1.json
  def destroy
      @post.destroy!
  
      respond_to do |format|
        format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
        format.json { head :no_content }
      end
  end
  
  private
  def find_post
    @post = Post.find_by(slug: params[:slug])
  end
  
      # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.includes(:category).find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render_404(e.message)
  end

  def render_404(message)
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found }
      format.json { render json: { error: message }, status: :not_found }
    end
  end
  
      # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :location, :deadline, :summary, :duties, :qualifications, :extrat, :available, :category_id)
  end
end