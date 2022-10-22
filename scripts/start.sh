#!/bin/bash
set -e

echo "bundle install..."
bundle check || bundle install --jobs 4

echo "yarn install"
yarn install

echo "setup database ..."
bundle exec rails db:prepare

# Then exec the container's main process (what's set as CMD in the Dockerfile).
./bin/dev
