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

## nats/pull: pull the nats image
.PHONY: nats/pull
nats/pull:
	@docker pull nats:"${NATS_TAG}"

## natsbox/pull: pull the nats-box image
.PHONY: natsbox/pull
natsbox/pull:
	@docker pull natsio/nats-box:${NATS_BOX_TAG}

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

## cmp/clean: stop and remove containers, networks
.PHONY: cmp/clean
cmp/clean:
	@docker-compose down

# ==============================================================================

# ==================================================================================== #
# Postgres
# ==================================================================================== #

## db/cp-script: copy a shell script to facilitate access to the mallbots database
.PHONY: db/cp-script
db/cp-script:
	@chmod +x ./db/scripts/get_psql.sh
	@docker cp ./db/scripts/get_psql.sh "${POSTGRES_CNTR}":/

## db/psql: start a psql instance for the mallbots database
.PHONY: db/psql
db/psql:
	@docker exec -it "${POSTGRES_CNTR}" ./get_psql.sh

## db/bash: start a shell instance on the Postgres container
.PHONY: db/bash
db/bash:
	@docker exec -it "${POSTGRES_CNTR}" bash

# ==============================================================================
