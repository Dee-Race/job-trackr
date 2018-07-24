class Application < ActiveRecord::Base
    belongs_to :user 
    belongs_to :job_title
    
    validates :company, :job_title, :job_location, :description, presence: true 
end
