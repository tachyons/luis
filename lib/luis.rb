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
    attr_accessor :id, :subscription_key, :is_staging, :is_verbose, :region
  end
  API_BASE_URI = 'https://%{region}.api.cognitive.microsoft.com/luis/v2.0/apps/%{id}'.freeze

  def self.api_uri
    API_BASE_URI % {id: id, region: region}
  end

  def self.is_preview_mod= value
    warn "[DEPRECATION] `is_preview_mod` is deprecated.  Please use `is_staging` instead."
    self.is_staging = value
  end

  # Query method for the luis
  #
  # @param [String,#read] query text
  # @param [Luis::Result] Luis result object
  def self.query(query, context_id = nil)
    options = default_options
    options['q'] = query
    options['contextId'] = context_id if context_id
    response = get(api_uri, query: options)
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
    options = { 'subscription-key' => subscription_key, 'region' => 'westus' }
    options['verbose'] = true if is_verbose
    options['staging'] = true if is_staging
    options
  end
end
