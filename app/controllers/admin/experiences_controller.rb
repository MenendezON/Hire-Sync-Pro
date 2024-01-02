# app/controllers/experiences_controller.rb
class Admin::ExperiencesController < ApplicationController
  before_action :set_applicant

  def new
    @experience = @applicant.experiences.build
    respond_to :js
  end
end
