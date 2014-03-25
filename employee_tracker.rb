require 'active_record'
require './lib/employee'
require './lib/project'
require './lib/division'
require './lib/contribution'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to Employee Spy--  'eh hem'... Employee Tracker 2000"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Press 'a' to add an employee, 'f' to delete an employee, 'l' to list employees, 'd' to create a division, 'assign division' to assign an employee to a division, 'ld' to list divisions, 'p' to add a project, 'assign project' to assign an employee to a project, 'lp' to list projects, 'c' to add an employee contribution to a project, or 'list projects' to list projects by division."
    puts "Press 'e' to exit."
    print ">"
    choice = gets.chomp
    case choice
    when 'a'
      add_employee
    when 'f'
      delete_employee
    when 'l'
      list_employees
    when 'ld'
      list_divisions
    when 'assign division'
      assign_employee_to_division
    when 'assign project'
      assign_employee_to_project
    when 'e'
      puts "Good-bye!"
    when 'p'
      add_project
    when 'lp'
      list_projects
    when 'd'
      add_division
    when 'c'
      add_contribution
    when 'list projects'
      list_projects_by_division
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add_employee
  puts "Enter the employee's name:"
  employee_name = gets.chomp
  employee = Employee.new({:name => employee_name})
  employee.save
  puts "'#{employee_name}' has been added to the database."
end

def delete_employee
  puts "Enter the employee's name:"
  employee_name = gets.chomp
  employee = Employee.find_by({:name => employee_name})
  employee.destroy
  puts "'#{employee_name}' has been deleted."
end


def list_employees
  puts "Employees:"
  employees = Employee.all
  Employee.all.each { |employee| puts employee.name }
end

def assign_employee_to_division
  list_employees
  puts "\nChoose an employee to assign:"
  print ">"
  employee_name = gets.chomp
  employee = Employee.find_by({:name => employee_name})
  list_divisions
  puts "\nChoose a division to assign #{employee_name} to:"
  print ">"
  division_name = gets.chomp
  division = Division.find_by({:name => division_name})
  division.employees << employee
  puts "#{employee_name} has been assigned to #{division_name}."
  division.save
rescue
  puts "Invalid parameters!"
end

def add_division
  puts "Enter the division's name:"
  division_name = gets.chomp
  division = Division.new({:name => division_name})
  division.save
  puts "'#{division_name}' has been added to the database."
end

def list_divisions
  puts "Company divisions:"
  divisions = Division.all
  Division.all.each do |division|
    puts division.name + ": "
    division.employees.each do |employee|
      print " #{employee.name} \n"
    end
  end
end

def add_project
  puts "Enter the project's name:"
  project_name = gets.chomp
  project = Project.new({:name => project_name})
  project.save
  puts "'#{project_name}' has been added to the database."
end

def add_contribution
  list_employees
  puts 'Which employee has contributed?'
  employee_name = gets.chomp
  employee = Employee.find_by({:name => employee_name})
  list_projects
  puts 'Which project is the contribution on?'
  project_name = gets.chomp
  project = Project.find_by({:name => project.name})
  puts 'Please enter a description for the contribution to tihs project:'
  description = gets.chomp
  contribution = Contribution.create({:description = description})
  employee.contributions << contribution
  project.contributions << contribution
end

def list_projects
  puts "Company projects:"
  projects = Project.all
  Project.all.each do |project|
    puts project.name + ": "
    project.employees.each do |employee|
      print " #{employee.name} \n"
    end
  end
end

def assign_employee_to_project
  list_employees
  puts "\nChoose an employee to assign:"
  print ">"
  employee_name = gets.chomp
  employee = Employee.find_by({:name => employee_name})
  list_projects
  puts "\nChoose a project to assign #{employee_name} to:"
  print ">"
  project_name = gets.chomp
  project = Project.find_by({:name => project_name})
  project.employees << employee
  puts "#{employee} has been assigned to #{project_name}."
  project.save
rescue
  puts "Invalid parameters!"
end

welcome
