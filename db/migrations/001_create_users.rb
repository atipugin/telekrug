Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      DateTime :created_at, null: false
      DateTime :updated_at
      Integer :telegram_id, null: false
    end

    alter_table :users do
      add_index :telegram_id, unique: true
    end
  end
end
