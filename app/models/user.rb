class User < ApplicationRecord
    has_secure_password
    has_many :assignments
    validates :email, :name, :surname, :password, presence:true, on: :create
    validates :email, uniqueness: {message: "already in use"}
    validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, presence: {message: "not formatted"}
    
end
