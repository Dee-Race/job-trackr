class User < ActiveRecord::Base
    
    has_many :user_applications
    has_many :applications, through: :user_applications

    
end
