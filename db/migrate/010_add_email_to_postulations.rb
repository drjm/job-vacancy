migration 10, :add_email_postulations do
  up do
  	modify_table :job_applications do
      add_column :email, String
    end
  end

  down do
  	modify_table :job_applications do
      drop_column :email
    end
  end
end