require 'rspec'
require 'active_record'
require 'shoulda-matchers'

require 'employee'
require 'division'
require 'project'
require 'contribution'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Employee.all {|employee| employee.destroy}
    Division.all {|division| division.destroy}
    Project.all {|project| project.destroy}
    Contribution.all {|contribution| contribution.destroy}
  end
end
