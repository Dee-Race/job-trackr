class JobTitle < ApplicationRecord
    has_many :applications 
    has_many :users, through: :applications

    accepts_nested_attributes_for :applications

    def new 
        @job_title = JobTitle.new 
    end

    def self.most_popular 
        JobTitle.group(:title).order('count DESC').limit(3) 
    end 


end
