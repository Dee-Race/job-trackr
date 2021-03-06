class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :company, :job_location, :description, :job_salary, :date_applied, :job_url

  belongs_to :job_title
  belongs_to :user
  has_many :comments
end
