class AddSubmittedToAssignments < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :submitted?, :boolean
  end
end
