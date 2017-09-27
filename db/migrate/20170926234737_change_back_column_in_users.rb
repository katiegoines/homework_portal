class ChangeBackColumnInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :user_type, :type
  end
end
