require_relative File.join(['..','test_helper'])

describe Server do
  describe 'when providing no name' do
    it 'must raise an error' do
      proc {Rubycon::Server.new(nil, 'foo', 27015, 'bar')}.must_raise ServerError
    end
  end
  describe 'when providing an empty name' do
    it 'must raise an error' do
      proc {Rubycon::Server.new('', 'foo', 27015, 'bar')}.must_raise ServerError
    end
  end
  describe 'when providing no address' do
    it 'must raise an error' do
      proc {Rubycon::Server.new('foo', nil, 27015, 'bar')}.must_raise ServerError
    end
  end
  describe 'when providing an empty address' do
    it 'must raise an error' do
      proc {Rubycon::Server.new('foo', '', 27015, 'bar')}.must_raise ServerError
    end
  end
  describe 'when providing no rcon password' do
    it 'must raise an error' do
      proc {Rubycon::Server.new('foo', 'bar', 27015, nil)}.must_raise ServerError
    end
  end
  describe 'when providing an empty rcon password' do
    it 'must accept that security issue' do
      Rubycon::Server.new('foo', 'bar', 27015, '')
    end
  end
end