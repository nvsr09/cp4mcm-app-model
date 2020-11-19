#!/bin/bash
# Script for install Tekton

## Installing openshift pipelines operator
oc apply -f openshift-pipelines-sub.yaml
sleep 3
oc new-project tekton-pipelines
sleep 1
## Modifying CP4MCM cluster image policy to install tekton dashboard
kubectl apply -f mcm-image-policy.yaml
sleep 1
## Installing tekton dashboard
kubectl apply --filename https://github.com/tektoncd/dashboard/releases/download/v0.6.1.4/openshift-tekton-dashboard-release.yaml --validate=false
sleep 2
## Installing tekton webhooks extension
kubectl apply --filename openshift-tekton-webhooks-extension-release.yaml
sleep 2
