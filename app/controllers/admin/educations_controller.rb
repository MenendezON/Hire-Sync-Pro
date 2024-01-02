# app/controllers/educations_controller.rb
class Admin::EducationsController < ApplicationController
  before_action :set_applicant

  def new
    @education = @applicant.educations.build
    respond_to :js
  end
end
