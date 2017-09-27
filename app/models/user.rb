class User < ApplicationRecord
    has_secure_password
    has_many :assignments
    validates :email, :name, :surname, :password, presence:true, on: :create
    validates :email, uniqueness:true
end
