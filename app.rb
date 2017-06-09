require 'sinatra/base'

class ThermostatAPI < Sinatra::Base

  DATA = './save.json'

  get '/thermostat' do
    response.headers["Access-Control-Allow-Origin"] = '*'
    File.read(DATA)
  end

  post '/thermostat' do
    response.headers["Access-Control-Allow-Origin"] = '*'
    File.write(DATA, { temperature: params['temperature'], powerSaving: params['powerSaving'] }.to_json)
  end
  run! if $PROGRAM_NAME==__FILE__
  
end
