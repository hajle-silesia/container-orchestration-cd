#!/usr/bin/env bash

set -eo pipefail

DIR="apps"

for app in $(ls "${DIR}"); do
  helm dependency build "${DIR}/${app}"
  helm template "${DIR}/${app}" | kubeconform -strict -verbose -summary #-ignore-missing-schemas
done
