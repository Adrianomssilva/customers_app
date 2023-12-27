class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

end
