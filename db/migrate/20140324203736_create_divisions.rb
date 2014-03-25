class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.column :name, :string
      t.column :employee_id, :integer

      t.timestamps
    end

    create_table :employees do |t|
      t.column :name, :string

      t.timestamps
    end

    create_table :projects do |t|
      t.column :name, :string
      t.column :employee_id, :integer

      t.timestamps
    end
  end
end
