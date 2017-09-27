class Assignment < ApplicationRecord
  belongs_to :user

  validates :title, :body, :category, :link, presence:true
  validates :link, uniqueness:true, on: :index
end
