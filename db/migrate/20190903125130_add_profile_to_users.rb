class AddProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string, null: true, default: nil
    add_column :users, :second_name, :string, null: true, default: nil
    add_column :users, :phone, :string, null: true, default: nil
  end
end
