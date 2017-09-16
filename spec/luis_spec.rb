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

  it '.query' do
     Luis.configure do |config|
       config.subscription_key = '123';
       config.id = '456'
     end
     VCR.use_cassette("bus time", record: :once) do
       expect(Luis.query('Bus time').top_scoring_intent).not_to be_nil
     end
  end
end
