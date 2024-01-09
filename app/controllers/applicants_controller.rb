# app/controllers/applicants_controller.rb
class ApplicantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]
  before_action :initialize_parsers, only: [:create]

  layout 'public'

  def initialize_parsers
    @resume_parser = ResumeParserService.new
    # Initialize other parsers if needed
  end

  def index
    redirect_to post_path(params[:post_id])
  end

  def show
  end

  def new
    @applicant = Applicant.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @applicant = Applicant.new(applicant_params)
    fill_fields_from_resume if params[:applicant][:resume].present?
    
    @applicant.post = @post
    if @applicant.save
      redirect_to @post, notice: 'Applicant was successfully created.'
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

  def fill_fields_from_resume
    resume_path = params[:applicant][:resume].tempfile.path
    parsed_data = @resume_parser.parse_resume(resume_path)
    @applicant.assign_attributes(parsed_data)
  end

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :phone, :email, :gender, :address, :language, :experience, :source, :resume, :cover_letter, experiences_attributes: [:id, :title, :company, :location, :current, :start_date, :end_date, :description, :_destroy], educations_attributes: [:id, :degree, :institution, :field_study, :location, :graduation_date, :_destroy])
  end
end
