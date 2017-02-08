require 'builder'
require 'cgi'
require 'open-uri'

class Api::Base
  attr_accessor :url, :key, :secret

  def initialize(url, key, secret)
    self.url = url
    self.key = key
    self.secret = secret
  end
end
