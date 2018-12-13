# frozen_string_literal: true

require 'spec_helper'

describe Grammarbot::Client do
  subject { described_class.new }

  describe '#language=' do
    it 'changes the language' do
      subject.language = 'en-GB'
      expect(subject.class.default_params[:language]).to eql('en-GB')
    end
  end

  describe '#api_key=' do
    it 'changes the api_key' do
      subject.api_key = 'test-key'
      expect(subject.class.default_params[:api_key]).to eql('test-key')
    end
  end

  describe '#base_uri=' do
    it 'changes the base_uri' do
      subject.base_uri = 'http://localhost:3000'
      expect(subject.class.base_uri).to eql('http://localhost:3000')
    end
  end
end
