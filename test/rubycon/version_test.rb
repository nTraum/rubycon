require_relative File.join(['..','test_helper'])

describe Rubycon do
  it 'must be defined' do
    VERSION.wont_be_nil
  end

  it 'must have the right version' do
    VERSION.must_equal '0.3'
  end
end