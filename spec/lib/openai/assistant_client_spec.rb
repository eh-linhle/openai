require 'openai/assistant_client'
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!

  config.filter_sensitive_data("<OPENAI_API_KEY>") do
    ENV['OPENAI_API_KEY']
  end

end

RSpec.describe OpenAI::AssistantClient do

  let(:client) { OpenAI::AssistantClient.new( ENV.fetch("OPENAI_API_KEY")) }

  describe '#get_list_assistants' do

    context "given prams: limit = 2" do
      it "execute successfully and returns 2 assistants" do
        VCR.use_cassette('get_list_assistants#limit=2') do
          result = client.get_list_assistants(2)
          expect !result.nil? and result.data.length == 2
        end
      end
    end

  end

end