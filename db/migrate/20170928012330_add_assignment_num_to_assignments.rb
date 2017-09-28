class AddAssignmentNumToAssignments < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :assignment_number, :integer
  end
end
