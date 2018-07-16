class AddCompanyToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :company, :string
  end
end
