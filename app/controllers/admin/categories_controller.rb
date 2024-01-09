class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authorize_admin!

  layout 'admin'
  def index
    @categories = current_user.company.users.map(&:categories).flatten.uniq
    @category = Category.new
  end

  # GET /categories/1 or /categories/1.json
  def show
    # @posts = @category.posts.order(created_at: :desc)
    # @total = @posts.count()
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to admin_categories_path, notice: 'Category created successfully.'
    else
      render 'new'
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    if @category.update(category_params)
      redirect_to admin_catgories_path, notice: 'Category updated'
    else
      redirect_to admin_categories_path, notice: 'Unable to update category'
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy!

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def authorize_admin!
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin? || current_user.moderator?
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
