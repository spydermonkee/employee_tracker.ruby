require 'spec_help'
describe Project do
  it { should have_and_belong_to_many :employees }
  it { should have_many :contributions}
end
