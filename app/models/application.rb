class Application < ActiveRecord::Base
    belongs_to :user 
    belongs_to :job_title

    accepts_nested_attributes_for :job_title
    
    validates :company, :job_location, :description, presence: true 
end
