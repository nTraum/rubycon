require 'steam-condenser'
require 'readline'
require 'highline/import'

module Rubycon
  class Console

    attr_accessor :host, :port, :rcon, :server, :commands

    def initialize(host = nil, port = nil, rcon = nil)
      begin
        @host = host || ask_for_host
        @port = port || ask_for_port
        @rcon = rcon || ask_for_rcon
      rescue EOFError, Interrupt
        exit
      end

      @server = create_server
      @commands = []
      setup_autocompletion
      run_console
    end

    def ask_for_host
      @host = ask('Host: ') do |q|
        q.validate = /\S+/
        q.responses[:ask_on_error] = :question
        q.responses[:not_valid] = 'Invalid host specification.'
      end
    end

    def ask_for_port
      @port = ask('Port: ', Integer) do |q|
        q.default = 27015
        q.above = 0
        q.responses[:ask_on_error] = :question
        q.responses[:not_valid] = 'Invalid port specification.'
        q.responses[:invalid_type] = 'Invalid port specification.'
      end
    end

    def ask_for_rcon
      @rcon = ask('RCON password: ') { |q| q.echo = false }
    end

    def create_server
      begin
        SourceServer.new(@host, @port)
      rescue SocketError
        puts "'#{@host}' not found. Wrong host?"
        exit
      end
    end

    def auth_if_necessary
      unless @server.rcon_authenticated?
        @server.rcon_auth(@rcon)
      end
    end

    def rcon_exec(line)
      begin
        auth_if_necessary
        @server.rcon_exec(line)
      rescue RCONNoAuthError
        puts 'Could not authenticate with gameserver. Wrong rcon password?'
        exit
      rescue Errno::ECONNREFUSED
        puts 'Connection refused. Wrong host?'
        exit
      rescue SteamCondenser::TimeoutError
        puts 'Connection timed out. Wrong host?'
        exit
      end
    end

    def setup_autocompletion
      add_cvars_from_server
      add_changelevel_commands
    end

    def add_cvars_from_server
      rcon_exec('cvarlist').each_line do |l|
        if l =~ /.*:.*:.*:.*/
          @commands << (l.split).first
        end
      end
    end

    def add_changelevel_commands
      rcon_exec('maps *').each_line do |l|
        if l =~ /PENDING.*/
          @commands << "changelevel #{((l.split).last).sub('.bsp', '')}"
        end
      end
    end

    def run_console
      comp = proc { |s| commands.grep( /^#{Regexp.escape(s)}/ ) }
      Readline.completion_append_character = ' '
      Readline.basic_word_break_characters = ''
      Readline.completion_proc = comp

      stty_save = `stty -g`.chomp

      begin
        while line = readline_with_history
          puts rcon_exec(line) unless line.empty?
        end
      rescue Interrupt
        system('stty', stty_save)
        exit
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