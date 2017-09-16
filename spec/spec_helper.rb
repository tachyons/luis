$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'luis'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.filter_sensitive_data('app_id') { '123' }
  config.filter_sensitive_data('subscription_key') { '456' }
  config.default_cassette_options = { :match_requests_on => [:query] }
end
