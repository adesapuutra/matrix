require 'selenium-webdriver'
require 'rspec/expectations'
require 'test/unit/assertions'

require 'httparty'
require 'pry'
require 'json-schema'

$env = ENV['ENV'] || 'MOCK'
ENVIRONMENT = (YAML.load_file('./config/environment.yml'))[$env]

AUTH = (YAML.load_file('./config/authentication.yml'))[$env]