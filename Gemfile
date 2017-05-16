source 'https://rubygems.org'

# Specify your gem's dependencies in logstash-mass_effect.gemspec
gemspec

if ENV["LOGSTASH_BRANCH"]
  gem 'logstash-core', :path => './logstash/logstash-core'
  gem 'logstash-core-plugin-api', :path => './logstash/logstash-core-plugin-api'
end
