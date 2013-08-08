require_relative File.join(['..','test_helper'])

describe Rubycon do
  it 'must have the right version' do
    Rubycon::VERSION.must_equal '0.3'
  end
end