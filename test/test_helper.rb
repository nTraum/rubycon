require 'coveralls'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/spec'

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

Coveralls.wear!

require File.join([File.dirname(__FILE__),'..','lib','rubycon.rb'])