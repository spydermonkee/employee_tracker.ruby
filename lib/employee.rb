class Employee < ActiveRecord::Base
  belongs_to :division
  has_and_belongs_to_many :projects
  has_many :contributions
end
