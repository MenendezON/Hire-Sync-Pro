# app/controllers/applicants_controller.rb
class Admin::ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]

  def index
    @applicants = Applicant.all
  end

  def show
  end

  def new
    @applicant = Applicant.new
    @post = Post.find(params[:post_id])
  end

  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.save
      redirect_to @applicant, notice: 'Applicant was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @applicant.update(applicant_params)
      redirect_to @applicant, notice: 'Applicant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @applicant.destroy
    redirect_to applicants_url, notice: 'Applicant was successfully destroyed.'
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:name, :email, experiences_attributes: [:id, :title, :company, :start_date, :end_date, :_destroy], educations_attributes: [:id, :degree, :institution, :graduation_date, :_destroy])
  end
end
