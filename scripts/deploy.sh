#!/bin/bash

set -e

ARTIFACT_BUCKET=infra-code-1
BUILD_NUMBER=2
STACK_NAME=nodeapp

aws cloudformation deploy \
  --template-file ../cfn/app.yaml \
  --stack-name $STACK_NAME \
  --parameter-overrides \
    ArtifactBucket=$ARTIFACT_BUCKET \
    BuildNumber=$BUILD_NUMBER \
  --capabilities CAPABILITY_NAMED_IAM