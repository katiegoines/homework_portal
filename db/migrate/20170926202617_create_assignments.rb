class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :body
      t.string :category
      t.string :link
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
