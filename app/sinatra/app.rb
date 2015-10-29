require 'sinatra'
require 'sinatra/base'

# Sinatra application class
class App < Sinatra::Base
  get '/' do
    'Hello from the New Physician API in Docker!'
  end

  # environment info
  get '/env' do
    'Environment:' \
    '<ul>' +
      ENV.each.map { |k, v| "<li><strong>#{k}:</strong> #{v}</li>" }.join +
      '</ul>'
  end

  # disk info
  get '/disk' do
    "<strong>Disk:</strong><br/><pre>#{`df -h`}</pre>"
  end

  #  memory info
  get '/memory' do
    "<strong>Memory:</strong><br/><pre>#{`free -m`}</pre>"
  end

  # Exit 'correctly'
  get '/exit' do
    Process.kill('TERM', Process.pid)
  end

  # Just terminate
  get '/fail' do
    Process.kill('KILL', Process.pid)
  end

end
