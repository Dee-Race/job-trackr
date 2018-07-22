class User < ActiveRecord::Base
    has_secure_password
    
    has_many :applications, through: :questions
    has_many :questions

    
end
