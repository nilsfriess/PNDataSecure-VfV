#!/bin/bash

chmod 600 ~/.ssh/deploy_rsa
cp .travis/ssh_config ~/.ssh/config

mix edeliver build release

if [ "$TRAVIS_BRANCH" == "production" ]; then
  mix edeliver deploy release to production
elif [ "$TRAVIS_BRANCH" == "development" ]; then
  mix edeliver deploy release to staging
  mix edeliver start staging
fi