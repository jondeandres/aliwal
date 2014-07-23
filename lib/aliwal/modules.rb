module Aliwal
  module Modules
    def self.modules_path
      File.expand_path('../../../modules', __FILE__)
    end

    def self.modules
      Dir[modules_path + '/*'].select do |path|
        File.directory?(path)
      end
    end

    def self.load_gemfiles(gemfile)
      modules.each do |path|
        gemfile.gemspec path: path
      end
    end
  end
end
