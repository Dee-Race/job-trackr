class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.integer :job_title_id
      t.integer :user_id
      t.string :job_location
      t.string :job_salary
      t.string :description
      t.string :job_url 
      t.string :company
      t.string :date_applied

      t.timestamps
    end
  end
end
