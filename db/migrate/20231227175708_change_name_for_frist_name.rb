class ChangeNameForFristName < ActiveRecord::Migration[7.1]
  def change
    rename_column :customers, :name, :frist_name
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
