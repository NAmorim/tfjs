#!/usr/bin/env bash
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================

# Deploy content in e2e/benchmarks to firebase hosting.

# Halt if a single command errors
set -e

PROJECT="jstensorflow"

if [[ "$1" == "--dev" ]]; then
  firebase serve \
    --config benchmarks/firebase_staging.json \
    --only hosting:tfjs-benchmarks-staging \
    --project ${PROJECT}
elif [[ "$1" == "--staging"  ]]; then
  firebase deploy \
    --config benchmarks/firebase_staging.json \
    --only hosting:tfjs-benchmarks-staging \
    --project ${PROJECT}
else
  firebase deploy \
    --config benchmarks/firebase.json \
    --only hosting:tfjs-benchmarks \
    --project ${PROJECT}
fi
