module Rubycon
  class ServerInfo
    attr_reader :map, :players_count, :players_max, :ping, :name

    def initialize(server)
      begin
        conn = SourceServer.new server.address, server.port
        @ping = conn.ping.round(0)
        @players_count = conn.server_info[:number_of_players]
        @players_max = conn.server_info[:max_players]
        @map = conn.server_info[:map_name]
        @name = conn.server_info[:server_name]
        @reachable = true
      rescue
        @reachable = false
      end
    end

    def reachable?
      @reachable
    end
  end
end