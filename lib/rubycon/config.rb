require 'yaml'

module Rubycon
  class Config
    attr_reader   :path
    attr_accessor :servers

    def initizialize(path)
      @servers = []
      @path = path

      if File.exists?
        yaml = YAML.load_file(path)
        yaml.each do |s|
          @servers << Server.from_hash(s)
        end
      end
    end

    def load(path)
      Config.new path
    end

    def save
      File.open(path, 'w') do |f|
        f.puts servers.to_yaml
      end
    end
  end
end