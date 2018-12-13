# frozen_string_literal: true

module Grammarbot
  class Client
    include HTTParty

    base_uri 'http://api.grammarbot.io/v2'
    format :json

    # Initializes API client
    # @param api_key [String] GrammarBot API key, optional
    # @param language [String] GrammarBot API key, optional
    def initialize(api_key: nil, language: 'en-US')
      api_key ||= ENV['GRAMMARBOT_API_KEY'] || 'ruby-default'
      self.class.default_params api_key: api_key, language: language
    end

    # Submits text for grammar and spelling errors to GrammarBot
    # @param text [String] text to submit
    # @return [Object] GrammarBot response
    def check(text)
      request(:get, '/check', query: { text: text })
    end

    private

    def request(http_method, path, query: {})
      response = self.class.send(http_method, path, query: query)
      JSON.parse response.body, object_class: OpenStruct
    end
  end
end
