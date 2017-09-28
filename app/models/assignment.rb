class Assignment < ApplicationRecord
  belongs_to :user

  validates :title, :body, :category, :link, :assignment_number, presence:true
  validates :link, uniqueness:true, on: :index

end

