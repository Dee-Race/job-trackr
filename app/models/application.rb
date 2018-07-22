class Application < ActiveRecord::Base
    has_many :users, through: :questions
    has_many :questions
    validates :company, :job_title, :job_location, :description, presence: true 
end
