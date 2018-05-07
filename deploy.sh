#!/bin/bash

chmod 600 ~/.ssh/pndsm-key.pem
cp .travis/ssh_config ~/.ssh/config

cat ~/.ssh/config

if [ "$TRAVIS_BRANCH" == "production" ]; then
  mix edeliver build release --branch=production
  mix edeliver deploy release to production
elif [ "$TRAVIS_BRANCH" == "development" ]; then
  mix edeliver build release --branch=development
  mix edeliver deploy release to staging
  mix edeliver start staging
fi