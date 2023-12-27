class ChangeNameColunm < ActiveRecord::Migration[7.1]
  def change
    rename_column :customers, :frist_name, :name
  end
end
