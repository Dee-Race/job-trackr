class Application < ActiveRecord::Base
    belongs_to :user 
    belongs_to :job_title
    validates :company, :job_location, :description, presence: true

   #accepts_nested_attributes_for :job_title, reject_if: :all_blank
    
     def job_titles_attributes=(job_title_attributes)
        job_title_attributes.values.each do |job_title_attribute|
            if job_title_attribute[:title] != ""
                job_title = JobTitle.find_or_create_by(job_title_attribute)
            self.job_titles << job_title
            end
        end 
    end

end
