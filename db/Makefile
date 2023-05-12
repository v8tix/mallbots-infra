include .envrc

# ==================================================================================== #
# HELPERS
# ==================================================================================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

# ==============================================================================

# ==================================================================================== #
# DOCKER
# ==================================================================================== #

## postgres/pull: pull the postgres image
.PHONY: postgres/pull
postgres/pull:
	@docker pull postgres:"${POSTGRES_TAG}"

## db/bash: start a shell instance on the Postgres container
.PHONY: db/bash
db/bash:
	@docker exec -it "${POSTGRES_CNTR}" bash

# ==============================================================================

# ==================================================================================== #
# DOCKER COMPOSE
# ==================================================================================== #

## cmp/build: build images before starting containers.
.PHONY: cmp/build
cmp/build:
	@docker-compose up --build

## cmp/up: run the Docker compose services
.PHONY: cmp/up
cmp/up:
	@docker-compose up --detach

## cmp/logs: show the Docker compose services logs
.PHONY: cmp/logs
cmp/logs:
	@docker-compose logs -f

## cmp/stop: stop and remove the containers
.PHONY: cmp/stop
cmp/stop:
	@docker-compose stop

## cmp/clean: stop and remove containers, networks, and volumes
.PHONY: cmp/clean
cmp/clean:
	@docker-compose down --volumes

# ==============================================================================

# ==================================================================================== #
# Postgres
# ==================================================================================== #

## db/cp-script: copy a shell script to facilitate access to the mallbots database
.PHONY: db/cp-script
db/cp-script:
	@chmod +x ./scripts/get_psql.sh
	@docker cp ./scripts/get_psql.sh "${POSTGRES_CNTR}":/

## db/psql: start a psql instance for the mallbots database
.PHONY: db/psql
db/psql:
	@docker exec -it "${POSTGRES_CNTR}" ./get_psql.sh

# ==============================================================================
