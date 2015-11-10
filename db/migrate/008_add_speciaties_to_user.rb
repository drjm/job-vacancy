migration 8, :add_speciaties_to_user do
  up do
    modify_table :users do
      add_column :specialties, String
    end
  end

  down do
    modify_table :users do
      drop_column :specialties
    end
  end
end
