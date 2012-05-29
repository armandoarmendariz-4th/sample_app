class CreateExperiences < ActiveRecord::Migration
  def self.up
    create_table :experiences do |t|
      t.integer :resume_id
      t.string :company_name
      t.string :job_position
      t.date :start_date
      t.date :end_date
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :experiences
  end
end
