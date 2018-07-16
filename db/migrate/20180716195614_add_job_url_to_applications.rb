class AddJobUrlToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :job_url, :string
  end
end
