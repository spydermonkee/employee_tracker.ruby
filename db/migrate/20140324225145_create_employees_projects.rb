class CreateEmployeesProjects < ActiveRecord::Migration
  def change
    drop_table :employees_and_projects
    create_table :employees_projects do |t|
      t.belongs_to :employee
      t.belongs_to :project
    end
  end
end
