migration 9, :create_job_applications do
  up do
    create_table :job_applications do
      column :id, Integer, :serial => true
      column :user_id, DataMapper::Property::Integer
      column :job_offer_id, DataMapper::Property::Integer
    end
  end

  down do
    drop_table :job_applications
  end
end