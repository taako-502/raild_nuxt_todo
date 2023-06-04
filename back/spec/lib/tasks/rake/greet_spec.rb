# frozen_string_literal: true

require 'spec_helper'
require 'rake'

RSpec.describe 'greet' do
  let(:greet_path) { 'tasks/greet' }

  before do
    Rake.application.rake_require greet_path
    Rake::Task.define_task(:environment)
  end

  describe 'test' do
    it 'test' do
      expect { Rake::Task['greet:say_hello'].invoke }.to output("Hello, World!\n").to_stdout
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