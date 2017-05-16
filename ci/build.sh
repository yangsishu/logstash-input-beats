#!/bin/bash
set -e

if [ "$LOGSTASH_BRANCH" ]; then
    git clone -b $BRANCH https://github.com/elastic/logstash.git logstash --depth 1
    cd ./logstash
    echo "Building plugins with Logstash version:"
    cat versions.yml
    # We need to build the jars for that specific version
    ./gradlew assemble
    cd ../
fi

bundle install
bundle exec rake test:integration:setup
bundle exec rake vendor
./gradlew test
bundle exec rspec spec
bundle exec rspec spec --tag integration
