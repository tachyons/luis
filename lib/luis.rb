require 'luis/version'
require 'luis/response'
require 'httparty'
module Luis
  include HTTParty
  class << self
   attr_accessor :id, :subscription_key
  end
  API_URL = 'https://api.projectoxford.ai/luis/v1/application'.freeze

  def self.query(query)
    response = get(API_URL, query: { 'id' => id, 'subscription-key' => subscription_key, 'q' => query })
    Response.new JSON.parse(response.body)
  end

  def self.configure(*_args)
    options.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
    yield(self) if block_given?
  end
end
