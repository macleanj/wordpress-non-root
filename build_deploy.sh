REPOSITORY=docker.io/jmaclean
IMAGE_NAME_BASE=wordpress-non-root
TAG=1

# Wordpress
IMAGE_NAME=wordpress
IMAGE_SOURCE_TAG=$(grep "FROM bitnami/${IMAGE_NAME}:" build/${IMAGE_NAME}/Dockerfile | sed -e 's/.*://g' | sed -e 's/ .*//g')
docker build -f ./build/${IMAGE_NAME}/Dockerfile --rm -t ${REPOSITORY}/${IMAGE_NAME_BASE}-${IMAGE_NAME}:${IMAGE_SOURCE_TAG}-${TAG} .
docker push ${REPOSITORY}/${IMAGE_NAME_BASE}-${IMAGE_NAME}:${IMAGE_SOURCE_TAG}-${TAG}

# Wordpress DB
IMAGE_NAME=mariadb
IMAGE_SOURCE_TAG=$(grep "FROM bitnami/${IMAGE_NAME}:" build/${IMAGE_NAME}/Dockerfile | sed -e 's/.*://g' | sed -e 's/ .*//g')
docker build -f ./build/${IMAGE_NAME}/Dockerfile --rm -t ${REPOSITORY}/${IMAGE_NAME_BASE}-${IMAGE_NAME}:${IMAGE_SOURCE_TAG}-${TAG} .
docker push ${REPOSITORY}/${IMAGE_NAME_BASE}-${IMAGE_NAME}:${IMAGE_SOURCE_TAG}-${TAG}
