class Admin::CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show edit update destroy ]

  # GET /admin/candidates or /admin/candidates.json
  def index
    @candidates = Candidate.all
  end

  # GET /admin/candidates/1 or /admin/candidates/1.json
  def show
  end

  # GET /admin/candidates/new
  def new
    @candidate = Candidate.new
    @post = Post.find(params[:post_id])
  end

  # GET /admin/candidates/1/edit
  def edit
  end

  # POST /admin/candidates or /admin/candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to candidate_url(@candidate), notice: "Candidate was successfully created." }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/candidates/1 or /admin/candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to candidate_url(@candidate), notice: "Candidate was successfully updated." }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/candidates/1 or /admin/candidates/1.json
  def destroy
    @candidate.destroy!

    respond_to do |format|
      format.html { redirect_to candidates_url, notice: "Candidate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.fetch(:candidate, {})
    end
end
