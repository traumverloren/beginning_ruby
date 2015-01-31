require 'rubygems'

spec = Gem::Specification.new do |s|
  s.name = 'string_extend'
  s.version = '0.0.1'
  s.summary = "StringExtend adds useful features to the String class"
  s.files = Dir.glob("**/**/**")
  s.test_files = Dir.glob("test/*_test.rb")
  s.author = "Stephanie"
  s.email = "traumverloren@gmail.com"
  s.has_rdoc = false
  s.required_ruby_version = '>=1.8.2'
end