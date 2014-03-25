class UpdateDivisions < ActiveRecord::Migration
  def change
    remove_column :divisions, :employee_id, :integer
    add_column :employees, :division_id, :integer
  end
end
