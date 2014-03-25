class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.belongs_to :employee
      t.belongs_to :project
      t.string :description

      t.timestamps
    end
    add_column :projects, :start_date, :date
    add_column :projects, :end_date, :date
  end
end
