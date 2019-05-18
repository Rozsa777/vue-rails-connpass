require 'httpclient'
require 'uri'
require 'json'

# connpass API のベースURL
BASE_URI = 'https://connpass.com/api/v1/event/'

class Api::ConnpassController < ApplicationController
  def event
    req = HTTPClient.new.get(BASE_URI, request.query_parameters)
    res = JSON.parse(req.body)
    render :json => res
  end
end
