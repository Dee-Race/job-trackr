class CreateUserApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_applications do |t|
      t.integer :user_id
      t.integer :application_id
      t.string :date_applied
      t.timestamps
    end
  end
end
