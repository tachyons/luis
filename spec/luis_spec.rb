require 'spec_helper'

describe Luis do
  it 'has a version number' do
    expect(Luis::VERSION).not_to be nil
  end

  it '.configure' do
    Luis.configure do |config|
      config.subscription_key = '1234'
    end

    expect(Luis.subscription_key).to be_eql('1234')
  end
end
