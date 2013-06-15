require 'steam-condenser'
require 'readline'
module Rubycon
  class RconSession


    def self.start(server_info)
      @@commands = []
      @@server_info = server_info
      @@session = SourceServer.new server_info.address, server_info.port

      self.setup_autocompletion_items
      self.run_console
    end

    def self.setup_autocompletion_items
      self.add_cvars_from_server
      self.add_changelevel_commands
    end

    def self.add_cvars_from_server
      self.rcon_exec('cvarlist').each_line do |l|
        if l =~ /.*:.*:.*:.*/
          @@commands << (l.split).first
        end
      end
    end

    def self.add_changelevel_commands
      self.rcon_exec('maps *').each_line do |l|
        if l =~ /PENDING.*/
          @@commands << "changelevel #{((l.split).last).sub('.bsp', '')}"
        end
      end
    end

    def self.auth_if_necessary
      unless @@session.rcon_authenticated?
        @@session.rcon_auth(@@server_info.rcon)
      end
    end

    def self.rcon_exec(line)
      begin
        auth_if_necessary
        @@session.rcon_exec(line)
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

    def self.run_console
      comp = proc { |s| @@commands.grep( /^#{Regexp.escape(s)}/ ) }
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
        @@session.disconnect
      end
    end

    def self.readline_with_history
      line = Readline.readline("> ", true)
      return nil if line.nil?
      if line =~ /^\s*$/ or Readline::HISTORY.to_a[-2] == line
        Readline::HISTORY.pop
      end
      line
    end
  end
end