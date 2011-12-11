require 'sinatra'
require "uri"
require 'net/http'
require 'json'

get '/' do
  response = Net::HTTP.get_response(URI.parse(params.fetch('u')))

  arg = {
    status: response.code,
    headers: response.to_hash,
    body: response.body
  }

  params['jsonp'] + "(#{arg.to_json})"  
end
