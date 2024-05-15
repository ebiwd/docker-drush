# docker-drush
PHP8 base

docker image based on [ebiwd/alpine-ssh:3.18](https://hub.docker.com/r/ebiwd/alpine-ssh/) containing drush for use in CI/CD pipelines

## Docker build & image push

Make sure you are login with your DockerHub username/password and then run below command to push updated changes to registry. Please make sure to update the version.

`docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag docker.io/ebiwd/docker-drush:3.18 .`

`docker push docker.io/ebiwd/docker-drush:3.18`
