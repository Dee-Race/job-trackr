class User < ActiveRecord::Base
    has_secure_password
    
    has_many :applications
    has_many :job_titles, through: :applications
    
    validates :email, presence: true, uniqueness: true 
   

    
end
