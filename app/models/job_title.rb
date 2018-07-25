class JobTitle < ApplicationRecord
    has_many :applications 
    has_many :users, through: :applications

    accepts_nested_attributes_for :user 

    def self.most_popular 
        #most popular job title method 
    end 


end
