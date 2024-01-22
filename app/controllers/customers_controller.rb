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

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Cliente atualizado com sucesso.'
    else
      flash.now[:notice] = 'Não foi possível atualizar'
      render :edit
    end
  end

  def delete
    @customer = Customer.find(params[:id])

    @customer.inactive!
    redirect_to customers_path, notice: "Cliente #{@customer.full_name} deletado."
  end

  def search
    @query = params["query"]
    if @query.present?
      @customers = Customer.active.where("name LIKE ?", "%#{@query}%")
    else
      redirect_to customers_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :last_name, :cellphone, :birthday,
                                      :number, :street, :district, :complement, :state, :city)
  end

end
