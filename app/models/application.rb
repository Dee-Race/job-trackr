class Application < ActiveRecord::Base
    has_many :user_applications
    has_many :users, through: :user_applications
    validates :company, :job_title, :job_location, :description, presence: true 
end
