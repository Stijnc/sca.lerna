#!/usr/bin/env bash

REGISTRY="callebaut.azurecr.io"
DIRECTORY=${PWD##*/}
BASENAME="azuredeploy"

while getopts u:a:f: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
        a) age=${OPTARG};;
        f) fullname=${OPTARG};;
    esac
done
echo "directory:" $DIRECTORY
echo "basename": $BASENAME
echo "modules/${DIRECTORY}/${BASENAME}.bicep"
echo "br:${REGISTRY}/bicep/modules/${DIRECTORY}:v{2}"

#bicep publish "modules/${DIRECTORY}/${BASENAME}.bicep" --target "br:${REGISTRY}/bicep/modules/${DIRECTORY}:v{2}"


CHANGED=$(lerna changed)

#lerna version --conventional-commits --yes

for row in ${CHANGED}; do
   unset VERSION
   PACKAGE=$(jq ./modules/${row}package.json)
   echo $PACKAGE 
done