class Project < ActiveRecord::Base
  has_and_belongs_to_many :employees
  has_many :contributions
end
