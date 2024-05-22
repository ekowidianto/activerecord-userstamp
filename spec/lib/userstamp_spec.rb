require 'rails_helper'

RSpec.describe Userstamp do
  it 'has a VERSION' do
    expect(Userstamp::VERSION).to match(/^\d+\.\d+\.\d+$/)
  end
end
