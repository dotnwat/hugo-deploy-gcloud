#!/bin/bash

SITE_SRC=${PWD}
MAIN_URL=https://nwat.xyz
WIP_URL=https://wip.nwat.xyz

DRAFT_DIR=$(mktemp -d)
trap "rm -rf ${DRAFT_DIR}" EXIT

branches=$(git ls-remote --heads ${SITE_SRC} | sed 's?.*refs/heads/??')
for branch in ${branches}; do
  url=${WIP_URL}/${branch}
  sha=$(git ls-remote ${SITE_DIR} refs/heads/${branch} | cut -f 1)

  if curl --output /dev/null --silent --head --fail "${url}/${sha}.cookie"; then
    exclude_dirs+=(${branch})
    echo "Branch ${branch} is already up to date... skipping"
  else
    echo "will build"
    #build ${WIP_URL}/${branch} ${branch} ${DRAFT_DIR}/${branch} -D -F
  fi
done
