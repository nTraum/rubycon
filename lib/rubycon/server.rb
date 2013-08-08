module Rubycon
  class Server
    attr_reader :name, :address, :port, :rcon

    def initialize(name, address, port, rcon)
      @name = name
      @address = address
      @port = port
      @rcon = rcon

      raise ServerError, 'ALIAS is required.' unless @name
      raise ServerError, 'HOSTNAME is required.' unless @address
      raise ServerError, 'PORT is required.' unless @port
      raise ServerError, 'RCON is required' unless @rcon
    end
  end
end