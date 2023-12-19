class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :last_name
      t.date :birthday
      t.string :street
      t.string :district
      t.integer :number
      t.string :complement
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
