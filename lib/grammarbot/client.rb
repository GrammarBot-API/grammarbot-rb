# frozen_string_literal: true

module Grammarbot
  class Client
    include HTTParty

    base_uri 'http://api.grammarbot.io/v2'
    debug_output $stdout
    format :json

    def initialize(api_key: nil, language: 'en-US')
      api_key ||= ENV['GRAMMARBOT_API_KEY'] || 'ruby-default'
      self.class.default_params api_key: api_key, language: language
    end

    def check(text)
      request(:get, '/check', query: { text: text})
    end

    private

    def request(http_method, path, query: {})
      response = self.class.send(http_method, path, query: query)
      JSON.parse response.body, object_class: OpenStruct
    end
  end
end
