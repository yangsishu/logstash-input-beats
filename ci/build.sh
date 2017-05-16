#!/bin/bash
set -ev

if [ "$LOGSTASH_BRANCH" ]; then
    git clone https://github.com/elastic/logstash.git $BRANCH --depth 1
    cd ./logstash
    # We need to build the jars for that specific version
    gradle assemble
    cd ../
fi

bundle install
bundle exec rake test:integration:setup
bundle exec rake vendor
./gradlew test
bundle exec rspec spec
bundle exec rspec spec --tag integration
