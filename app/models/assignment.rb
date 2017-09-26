class Assignment < ApplicationRecord
  belongs_to :user

  validates :title, :body, :category, :link, presence:true
end
