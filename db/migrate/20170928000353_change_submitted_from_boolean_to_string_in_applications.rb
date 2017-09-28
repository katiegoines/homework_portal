class ChangeSubmittedFromBooleanToStringInApplications < ActiveRecord::Migration[5.1]
  def change
    change_column :assignments, :submit, :string
  end
end
