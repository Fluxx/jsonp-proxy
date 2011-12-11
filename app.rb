require 'sinatra'
require "uri"
require 'net/http'
require 'json'

get '/' do
  url = params.fetch('u') do
    halt 'Please specifty a "u" query parater for the URL.'
  end

  response = Net::HTTP.get_response(URI.parse(url))

  arg = {
    status: response.code,
    headers: response.to_hash,
    body: response.body
  }

  params['jsonp'] + "(#{arg.to_json})"  
end
