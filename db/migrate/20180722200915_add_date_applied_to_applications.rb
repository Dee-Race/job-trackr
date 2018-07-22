class AddDateAppliedToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :date_applied, :string
  end
end
