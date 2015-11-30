migration 11, :add_to_users_lock_account_and_date do
  up do
  	modify_table :users do
      add_column :date_blocked, DateTime
      add_column :blocked, 'Boolean', :default => false
      add_column :access_count, Integer, :default => 3
    end
  end

  down do
  	modify_table :users do
      drop_column :date_blocked
      drop_column :blocked
      drop_column :access_count
    end
  end
end