require 'spec_help'

describe Contribution do
  it { should belong_to :employee}
  it { should belong_to :project}
end
