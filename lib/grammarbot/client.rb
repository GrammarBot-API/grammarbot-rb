# frozen_string_literal: true

module Grammarbot
  class Client
    include HTTParty

    # Initializes API client
    # @param api_key [String] GrammarBot API key, optional
    # @param language [String] language in which to check, optional
    # @param base_uri [String] GrammarBot API server url, optional
    def initialize(api_key: nil, language: 'en-US', base_uri: 'http://api.grammarbot.io')
      api_key ||= ENV['GRAMMARBOT_API_KEY'] || 'ruby-default'
      self.class.base_uri base_uri
      self.class.default_params api_key: api_key, language: language
    end

    # Submits text for grammar and spelling errors to GrammarBot
    # @param text [String] text to submit
    # @return [Object] GrammarBot response
    def check(text)
      request(:get, '/v2/check', query: { text: text })
    end

    # Change client api_key
    # @param new_api_key [String] API key
    def api_key=(new_api_key)
      self.class.default_params[:api_key] = new_api_key
    end

    # Change language for text check
    # @param lang [String] language code
    def language=(lang)
      self.class.default_params[:language] = lang
    end

    # Change client base_uri
    # @param uri [String] API endpoint base uri
    def base_uri=(uri)
      self.class.base_uri(uri)
    end

    private

    def request(http_method, path, query: {})
      response = self.class.send(http_method, path, query: query)
      JSON.parse response.body, object_class: OpenStruct
    end
  end
end
