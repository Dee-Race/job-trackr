class JobTitle < ApplicationRecord
    has_many :applications 
    has_many :users, through: :applications

 

    def self.most_popular 
        JobTitle.group(:title).order('count_id DESC').limit(3).count(:id)
    end 


end
