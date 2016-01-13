namespace :configure do

  class ConfigFileGenerator
    attr_accessor :config_hash

    # The config file
    CONFIG_FILE = '.env'

    def initialize
      @config_hash = {}

      build_hash
    end

    # Adds or creates a new config option to the hash.
    #
    # Arguments:
    #
    # (string) key: The key to add to the hash.  This value will be upcased due to
    #   environment variable nameing conventions.
    #
    # (string) value: The value associated with the key.
    def add_config_option(key, value)
      # @config_hash[key.upcase] = value.chomp
      @config_hash[key.upcase] = value.is_a?(Fixnum) ? value : value.chomp
    end

    # Removes an existing key from the hash, along with any associated value it may have.
    #
    # Arguments:
    #
    # (string) key: The key to remove from the hash.  Like add_config_option, this value will be upcased due to
    #   environment variable naming conventions.
    def remove_config_option(key)
      @config_hash.delete key.upcase
    end

    # Builds the config hash so that it may be later written to file.
    def build_hash
      if File.exist?(ConfigFileGenerator::CONFIG_FILE)
        lines = File.readlines(ConfigFileGenerator::CONFIG_FILE)

        lines.each do |line|
          regex = /(?<key>[A-Z_]+)=(?<value>\w+)/
          key = regex.match(line)['key']
          value = regex.match(line)['value']

          @config_hash[key] = value
        end
      end
    end

    # Writes all keys and values stored in the config hash to a file.
    def write_to_file
      target = open(ConfigFileGenerator::CONFIG_FILE, 'w')

      @config_hash.each do |key, value|
        target.write "#{key}=#{value}\n"
      end

      target.close
    end
  end

  desc 'Generates or rotates app secrets for test and production environments'
  task secrets: :environment do
    config = ConfigFileGenerator.new

    ['SECRET_KEY_BASe', 'TEST_SECRET_KEY_BASE'].each do |key|
      config.add_config_option(key, `rake secret`)
    end

    config.write_to_file

    puts "Your app secrets have now been rotated.  You may find them in $PROJECT_ROOT/.env"
  end

end
