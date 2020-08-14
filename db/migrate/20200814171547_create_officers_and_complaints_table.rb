class CreateOfficersAndComplaintsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :officers, id: false, primary_key: :id do |t|
      t.primary_key :id, :string
      t.string :employee_id, null: true
      t.string :name, null: false
      t.string :job_profile, null: false
      t.boolean :active, null: false
      t.date :termination_date, null: true
      t.date :rehire_date, null: true
      t.boolean :transferred, null: false
    end

    create_table :complaints, id: false, primary_key: :incident_id do |t|
      t.primary_key :incident_id, :string
      t.string :incident_type, null: false
      t.date :received_date, null: false
      t.date :completed_date, null: true
      t.string :last_name, null: true
      t.string :first_name, null: true
      t.string :allegation, null: true
      t.string :directive, null:true
      t.string :finding, null: true
      t.string :action_taken, null: true
      t.string :disposition, null: true
      t.references :officer, foreign_key: true, null: true, type: :string
    end
  end
end
