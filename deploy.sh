#!/bin/bash

chmod 600 ~/.ssh/pndsm-key.pem
cp .travis/ssh_config ~/.ssh/config

cat ~/.ssh/config

mix edeliver build release

if [ "$TRAVIS_BRANCH" == "production" ]; then
  mix edeliver deploy release to production
elif [ "$TRAVIS_BRANCH" == "development" ]; then
  mix edeliver deploy release to staging
  mix edeliver start staging
fi