#require "#{Dir.pwd}/lib/application_settings.rb"
Settings = YAML.load_file("config/settings.yml")[Rails.env]
