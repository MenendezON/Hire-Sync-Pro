class Admin::CompaniesController < ApplicationController

    layout 'admin'
    def index
        @companies = Company.all
    end
end
