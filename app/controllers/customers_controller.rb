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

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: 'Cliente salvo com sucesso'
    else
      flash.now[:notice] = 'Cliente não cadastrado'
      render :new
    end

  end


  private

  def customer_params
    params.require(:customer).permit(:name, :email, :last_name, :cellphone, :birthday,
                                      :number, :street, :district, :complement, :state, :city)
  end

end
