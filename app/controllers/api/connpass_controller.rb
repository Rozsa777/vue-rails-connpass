require 'httpclient'
require 'uri'
require 'json'

# connpass API のベースURL
BASE_URI = 'https://connpass.com/api/v1/event/'

class Api::ConnpassController < ApplicationController
  def event
    params = {
      series_id: 1712
    }
    req = HTTPClient.new.get(BASE_URI, params)
    res = JSON.parse(req.body)
    puts res
    render :json => res
  end
end
