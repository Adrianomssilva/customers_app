class AddCellphoneToCustomer < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :cellphone, :string
  end
end
