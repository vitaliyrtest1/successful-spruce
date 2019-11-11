#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5d35763a5183e00011f92943/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5d35763a5183e00011f92943
curl -s -X POST https://api.stackbit.com/project/5d35763a5183e00011f92943/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5d35763a5183e00011f92943/webhook/build/publish > /dev/null
