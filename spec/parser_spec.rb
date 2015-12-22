require_relative '../parser'
require 'rspec'
require 'simplecov'

SimpleCov.start

RSpec.describe Parser do
  context '#parse' do
    it 'parse incorrect files' do
      file_dir = Dir.pwd + '/spec/test_cases/case1'

      expect(Parser.new(file_dir).parse).to eq({})
    end

    it 'parse correct files' do
      file_dir = Dir.pwd + '/spec/test_cases/case2'

      expect(Parser.new(file_dir).parse).to eq({'U6342': {'20150112': ['Account'], '20150113': ['Account']}})
    end

    it 'parse different files' do
      file_dir = Dir.pwd + '/spec/test_cases/case3'

      expect(Parser.new(file_dir).parse).to eq({'U6342': {'20150112': ['Account']}})
    end
  end
end