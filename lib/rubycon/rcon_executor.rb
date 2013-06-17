module Rubycon
  class RconExecutor
      attr_reader :response
    def initialize(server_info, command)
      begin
        @commands = []
        @server_info = server_info
        @session = SourceServer.new @server_info.address, @server_info.port
        @session.rcon_auth(@server_info.rcon)
        @response = rcon_exec command
      rescue RCONNoAuthError
        @response = 'Could not authenticate with gameserver. Wrong rcon password?'
      rescue Errno::ECONNREFUSED
        @response = 'Connection refused. Wrong host?'
      rescue SteamCondenser::TimeoutError
        @response = 'Connection timed out while sending command!'
      rescue Exception => e
        @response = "#{e.message}"
      end
    end

    private
    def rcon_exec(line)
      @session.rcon_exec(line)
    end
  end
end