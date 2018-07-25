class JobTitle < ApplicationRecord
    has_many :applications 
    has_many :users, through: :applications

    def most_popular 
        #most popular job title method 
    end 


end
