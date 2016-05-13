class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      redirect_to @company
    else
      flash[:error] = 'Todos os campos são obrigatórios'
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.all
  end

  private

  def company_params
    params.require(:company)
          .permit(:name, :cnpj, :address, :mail, :phone,
                  :company_name, :contact)
  end
end
