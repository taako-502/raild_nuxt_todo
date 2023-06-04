# frozen_string_literal: true

require 'spec_helper'
require 'rake'

RSpec.describe 'greet' do
  let(:greet_path) { 'tasks/greet' }

  before do
    Rake.application.rake_require greet_path
    Rake::Task.define_task(:environment)
  end

  describe 'greet:say_hello' do
    it 'say_hello' do
      expect { Rake::Task['greet:say_hello'].invoke }.to output("Hello, World!\n").to_stdout
    end
  end


  describe 'greet:mock_test' do
    it 'greet.mock_test' do
      expect_any_instance_of(Greet).to receive(:test).and_return('mocked_test_result')
      expect { Rake::Task['greet:mock_test'].invoke }.to output("mocked_test_result\n").to_stdout
    end
  end

  describe 'greet_chinese' do
    it '你好を出力する' do
      expect { greet_chinese }.to output("你好\n").to_stdout
    end
  end

  describe 'test' do
    it 'test' do
      expect(test).to eq "test"
    end
  end
end