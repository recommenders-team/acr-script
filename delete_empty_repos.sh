#!/bin/bash
registry="978a92daa2ad4447aae1b21196dd4a9b"

az acr repository list --name $registry --output tsv | while read repo; do
  if [ -z "$(az acr repository show-tags --name $registry --repository $repo --output tsv 2>/dev/null)" ]; then
    az acr repository delete --name $registry --repository $repo --yes
    echo "Deleted empty repository: $repo"
  else
    echo "Repository $repo is not empty, skipping..."
  fi
done
