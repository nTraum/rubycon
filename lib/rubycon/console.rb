require 'steam-condenser'
require 'readline'
require 'highline/import'

module Rubycon
  class Console

    attr_accessor :host, :port, :rcon, :server

    def initialize(host = nil, port = nil, rcon = nil)
      @host = host || ask_for_host
      @port = port || ask_for_port
      @rcon = rcon || ask_for_rcon


      @server = create_server
      run_console
    end

    def ask_for_host
      @host = ask('Host: ') { |q| q.default = 'localhost' }
    end

    def ask_for_port
      @port = ask('Port: ', Integer) do |q|
        q.default = 27015
        q.in = 0..9999999
      end
    end

    def ask_for_rcon
      @rcon = ask('RCON password: ') { |q| q.echo = false }
    end

    def create_server
      SourceServer.new(@host, @port)
    end

    def rcon_exec(line)
      unless @server.rcon_authenticated?
        @server.rcon_auth(@rcon)
      end
      @server.rcon_exec(line)
    end

    def cvars_from_server
      cvars = []
      rcon_exec('cvarlist').each_line do |l|
        if l =~ /.*:.*:.*:.*/
          cvars << (l.split).first
        end
      end
      cvars
    end

    def create_changelevel_commands
      maps = []
      rcon_exec('maps *').each_line do |l|
        if l =~ /PENDING.*/
          maps << "changelevel #{((l.split).last).sub('.bsp', '')}"
        end
      end
      maps
    end

    def run_console
      commands = []
      commands += cvars_from_server
      commands += create_changelevel_commands
      comp = proc { |s| commands.grep( /^#{Regexp.escape(s)}/ ) }
      Readline.completion_append_character = ''
      Readline.basic_word_break_characters = ''
      Readline.completion_proc = comp

      while line = readline_with_history
        puts rcon_exec(line) unless line.empty?
      end
    end

    def readline_with_history
      line = Readline.readline("#{host}:#{port}> ", true)
      return nil if line.nil?
      if line =~ /^\s*$/ or Readline::HISTORY.to_a[-2] == line
        Readline::HISTORY.pop
      end
      line
    end
  end
end