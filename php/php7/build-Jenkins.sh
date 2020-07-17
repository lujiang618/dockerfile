#!/bin/bash

# exit when any command fails
set -e

if [[ "${ENV_NAME}" = '' ]]; then
  echo 'ENV_NAME is unset'
  exit 1;
fi

if [[ "${DOCKER_REPO}" = '' ]]; then
  echo 'DOCKER_REPO is unset'
  exit 1;
fi

if [[ "${GIT_COMMIT}" = '' ]]; then
  GIT_COMMIT="$(git rev-parse --short HEAD)"
fi

if [[ "${SKIP_LOGIN}" = '' ]]; then
  SKIP_LOGIN="no"
fi

TAG=${ENV_NAME}_${GIT_COMMIT}
DOCKER_DIR=$(dirname $0)/..
CONTEXT_DIR=${DOCKER_DIR}/..
IMAGE_URL=${DOCKER_REPO}/content-academic:${TAG}

docker build \
    --build-arg BUILD_ENV=${ENV_NAME}  \
    --force-rm 					\
    -f ${DOCKER_DIR}/Dockerfile	\
    -t ${IMAGE_URL} 				\
    ${CONTEXT_DIR}

if [[ $? -eq 0 ]] && [[ "$ENV_NAME" != "local" ]]
then
    if [[ "${SKIP_LOGIN}" != 'yes' ]]; then
        docker login ${DOCKER_REPO} < /dev/null
        if [[ $? -ne 0 ]]; then
            echo "Log into docker registry:"

            if [[ "${DOCKER_REPO_USER}" = '' ]]; then
                echo 'DOCKER_REPO_USER is unset'
                exit 1;
            fi

            if [[ "${DOCKER_REPO_PASSWORD}" = '' ]]; then
                echo 'DOCKER_REPO_PASSWORD is unset'
                exit 1;
            fi

            docker login -u ${DOCKER_REPO_USER} -p ${DOCKER_REPO_PASSWORD} ${DOCKER_REPO}
        fi
    fi
    docker push ${IMAGE_URL}
fi

echo ${IMAGE_URL}