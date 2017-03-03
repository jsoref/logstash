#!/usr/bin/env bash
set -e
if [[ ! -d "build" ]]; then
    mkdir build
fi
rm -rf build/*
echo "Building logstash tar file in build/"
rake artifact:tar
cd build
echo "Extracting logstash tar file in build/"
tar xf *.tar.gz

cd ../qa/integration
pwd
echo $BUNDLE_GEMFILE
# to install test dependencies
bundle install --gemfile="Gemfile"
bundle exec rspec spec/cli/http_proxy_install_spec.rb
