begin
require 'dotenv'
Dotenv.load
rescue
end

APP_NAME = File.basename(File.dirname(__FILE__))
puts "Loading #{APP_NAME}"

require 'sinatra'

require 'sinatra/activerecord'
require 'rack-flash'


# Just in development!
configure :development do
  require 'better_errors'
  use BetterErrors::Middleware
  # you need to set the application root in order to abbreviate filenames
  # within the application:
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

require_relative "helpers/formatting"
require_relative "helpers/layout"
require_relative "helpers/auth"

#require_relative "helpers/..."

#require_relative "models/...."

require_relative "controllers/home"
require_relative "controllers/auth"

enable :sessions
set :session_secret, ENV['SESSION_SECRET'] || 'MY_DEV_SECRETS'

set :raise_errors, true
set :show_exceptions, true

use Rack::Flash

get '/' do
  erb :home
end
