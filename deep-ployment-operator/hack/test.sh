#!/bin/bash
set -e 

kubectl kuttl test ./tests/k8s --config ./tests/kuttl-tests.yaml 