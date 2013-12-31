require 'spec_helper'

describe Slashdot do
  it 'should have a version number' do
    Slashdot::VERSION.should_not be_nil
  end
end
