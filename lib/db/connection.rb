require 'dotenv/load'
require 'sequel'
#require 'logger'

HOST = ENV['DB_HOST']
USER = ENV['DB_USER']
PASS = ENV['DB_PASS']
DBNAME = ENV['DB_NAME']

#LOG = Logger.new(STDOUT)

DB = Sequel.connect("postgres://#{USER}:#{PASS}@#{HOST}/#{DBNAME}",
  max_connections: 10)
#DB.loggers << LOG