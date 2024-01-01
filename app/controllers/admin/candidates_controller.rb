class Admin::CandidatesController < ApplicationController
  before_action :set_admin_candidate, only: %i[ show edit update destroy ]

  # GET /admin/candidates or /admin/candidates.json
  def index
    @admin_candidates = Candidate.all
  end

  # GET /admin/candidates/1 or /admin/candidates/1.json
  def show
  end

  # GET /admin/candidates/new
  def new
    @admin_candidate = Candidate.new
  end

  # GET /admin/candidates/1/edit
  def edit
  end

  # POST /admin/candidates or /admin/candidates.json
  def create
    @admin_candidate = Candidate.new(admin_candidate_params)

    respond_to do |format|
      if @admin_candidate.save
        format.html { redirect_to admin_candidate_url(@admin_candidate), notice: "Candidate was successfully created." }
        format.json { render :show, status: :created, location: @admin_candidate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/candidates/1 or /admin/candidates/1.json
  def update
    respond_to do |format|
      if @admin_candidate.update(admin_candidate_params)
        format.html { redirect_to admin_candidate_url(@admin_candidate), notice: "Candidate was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_candidate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/candidates/1 or /admin/candidates/1.json
  def destroy
    @admin_candidate.destroy!

    respond_to do |format|
      format.html { redirect_to admin_candidates_url, notice: "Candidate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_candidate
      @admin_candidate = Candidate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_candidate_params
      params.fetch(:admin_candidate, {})
    end
end
