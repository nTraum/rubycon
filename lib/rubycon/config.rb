module Rubycon
  class Config
    attr_reader :path, :servers

    def initialize(path)
      @servers = []
      @path = path

      if File.exists?(path)
        yaml = YAML.load_file(path)
        yaml.each do |server|
          @servers << server
        end
      end
    end

    def self.load(path)
      Config.new path
    end

    def save
      FileUtils.makedirs File.dirname(@path)

      servers.sort! {|a,b| a.name.downcase <=> b.name.downcase}
      File.open(path, 'w') do |f|
        f.puts servers.to_yaml
      end
    end

    def add_server(server)
      @servers << server
      save
    end

    def delete_all_servers
      @servers = []
      save
    end

    def delete_server(name)
      deleted_server = @servers.delete(find_by_name(name))
      save
      deleted_server
    end

    def find_by_name(name)
      @servers.find {|server| name.downcase == server.name.downcase}
    end

    def find_by_host_and_port(address, port)
      @servers.find {|server| port == server.port and server.address.downcase == address.downcase}
    end
  end
end