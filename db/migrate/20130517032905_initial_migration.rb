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

  end
end
