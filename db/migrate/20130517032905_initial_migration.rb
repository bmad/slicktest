class InitialMigration < ActiveRecord::Migration
  def change

    create_table :projects do |t|
      t.string :name

      t.timestamps
    end

    create_table :test_cases do |t|
      t.references :project
      t.string :name
      t.text :description

      t.timestamps
    end

    create_table :steps do |t|
      t.references :test_case
      t.integer :place
      t.string :status
      t.text :description

      t.timestamps
    end

    create_table :runs do |t|
      t.references :project
      t.string :name
      t.string :status
      t.boolean :archived
    end

    create_table :run_cases do |t|
      t.references :run
      t.string :name
      t.text :description
    end

    create_table :run_steps do |t|
      t.references :run_case
      t.integer :place
      t.string :status
      t.text :description
    end

  end
end
