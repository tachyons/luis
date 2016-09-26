require 'luis/version'
require 'httparty'
module Luis
  autoload :Base, 'luis/base'
  autoload :Result, 'luis/result'
  autoload :Intent, 'luis/intent'
  autoload :Action, 'luis/action'
  autoload :Parameter, 'luis/parameter'
  autoload :Dialog, 'luis/dialog'
  autoload :Entity, 'luis/entity'

  include HTTParty
  class << self
   attr_accessor :id, :subscription_key
  end
  API_URL = 'https://api.projectoxford.ai/luis/v1/application/preview'.freeze

  def self.query(query)
    response = get(API_URL, query: { 'id' => id, 'subscription-key' => subscription_key, 'q' => query })
    Result.new JSON.parse(response.body)
  end

  def self.configure(options = {})
    options.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
    yield(self) if block_given?
  end
end
