class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :job_title
      t.string :job_location
      t.string :job_salary
      t.string :description

      t.timestamps
    end
  end
end
