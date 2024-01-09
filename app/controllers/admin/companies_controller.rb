class Admin::CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :edit, :update, :destroy]

    layout 'admin'
    def index
        @companies = Company.all
    end

    def show
      end

    def new
        @company = Company.new
      end

    def create
        @company = Company.new(company_params)
    
        if @company.save
          redirect_to admin_companies_path, notice: 'Company was successfully created.'
        else
          render :new
        end
      end

    def edit
      end

      def update
        if @company.update(company_params)
          redirect_to admin_company_path(@company), notice: 'Company was successfully updated.'
        else
          render :edit
        end
      end

    def destroy
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully destroyed.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :description, :address, :city, :state, :zip_code, :email, :phone_number, :website, :industry, :establishment_date, :revenue, :logo_url)
  end
end
