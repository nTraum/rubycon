module Rubycon
  class Server
    attr_reader :name, :address, :port, :rcon

    def initialize(name, address, port, rcon)
      @name = name
      @address = address
      @port = port
      @rcon = rcon
    end

    def self.from_hash(hash)
      Server.new(hash['name'], hash['address'], hash['port'], hash['rcon'])
    end
  end
end