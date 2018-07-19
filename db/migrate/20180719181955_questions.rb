class Questions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
    t.string :content 
    t.integer :user_id
    t.integer :application_id 
    end 
  end
end
