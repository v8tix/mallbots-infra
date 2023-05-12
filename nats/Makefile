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

## natsbox/bash: start a shell instance on the nats-box container
.PHONY: natsbox/bash
natsbox/bash:
	@docker run --network ${NATS_NETWORK} --rm -it natsio/nats-box:${NATS_BOX_TAG}

## cntr/networks: list the Docker container networks on the system
.PHONY: cntr/networks
cntr/networks:
	@docker network ls

## nats/net: log the /etc/hosts file present on the containers
.PHONY: nats/net
nats/net:
	@docker exec -it "${NATS_CNTR}" cat /etc/hosts

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
# NATS
# ==================================================================================== #
## nats/telnet: telnet to N1 nats cluster node
.PHONY: nats/telnet
nats/telnet:
	@telnet "${NATS_N1_CNTR_LOOKUP}" 4222

# ==============================================================================