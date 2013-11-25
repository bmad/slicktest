class InitialMigration < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :status
    end

    create_table :projects do |t|
      t.string :name
      t.string :status, default: 'new'

      t.timestamps
    end

    create_table :test_cases do |t|
      t.references :project
      t.string :name
      t.string :status, default: 'new'
      t.text :description

      t.timestamps
    end

    create_table :steps do |t|
      t.references :test_case
      t.integer :place
      t.string :status, default: 'new'
      t.text :description

      t.timestamps
    end

    create_table :runs do |t|
      t.references :project
      t.string :name
      t.string :status, default: 'new'
    end

    create_table :run_cases do |t|
      t.references :run
      t.string :name
      t.text :description
    end

    create_table :run_steps do |t|
      t.references :run_case
      t.integer :place
      t.string :status, default: 'new'
      t.text :note
      t.text :description
    end

  end
end
