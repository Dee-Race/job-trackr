class JobTitle < ApplicationRecord
    has_many :applications 
    has_many :users, through: :applications

 

    def self.most_popular 
        order('count DESC').limit(3) 
    end 


end
