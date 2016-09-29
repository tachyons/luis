require 'luis/version'
require 'httparty'
# Luis Module
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

  # Query method for the luis
  #
  # @param [String,#read] query text
  # @param [Luis::Result] Luis result object
  def self.query(query, context_id = nil)
    options = default_options
    options['q'] = query
    options['contextId'] = context_id if context_id
    response = get(API_URL, query: options)
    Result.new JSON.parse(response.body)
  end

  # Configure luis credentials and settings
  #
  # @param [options] contains list of options to set
  def self.configure(options = {})
    options.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
    yield(self) if block_given?
  end

  def self.default_options
    { 'id' => id, 'subscription-key' => subscription_key }
  end
end
