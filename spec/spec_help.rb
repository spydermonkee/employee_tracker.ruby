require 'rspec'
require 'active_record_migrations'

require 'employee'
require 'division'
require 'project'

RSpec.configure do |config|
  config.after(:each) do
    Employee.all {|employee| employee.destroy}
    Division.all {|division| division.destroy}
    Project.all {|project| project.destroy}
  end
end
