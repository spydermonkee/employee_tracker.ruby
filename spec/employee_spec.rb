require 'spec_help'

describe Employee do
  it {should belong_to :division}
  it {should have_many :contributions}
end
