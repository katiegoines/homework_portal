class ChangeSubmittedFromBooleanToStringInApplication < ActiveRecord::Migration[5.1]
  def change
    rename_column :assignments, :submitted?, :submit
  end
end
