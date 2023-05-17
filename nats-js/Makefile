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

## nats/net-1: log the /etc/hosts file present on the N1 server
.PHONY: nats/net-1
nats/net-1:
	@docker exec -it "${NATS_N1}" cat /etc/hosts

## nats/net-2: log the /etc/hosts file present on the N2 server
.PHONY: nats/net-2
nats/net-2:
	@docker exec -it "${NATS_N2}" cat /etc/hosts

## nats/net-3: log the /etc/hosts file present on the N3 server
.PHONY: nats/net-3
nats/net-3:
	@docker exec -it "${NATS_N3}" cat /etc/hosts

## nats/reload-n1: reloads the n1 server configuration
.PHONY: nats/reload-n1
nats/reload-n1:
	@docker exec -it "${NATS_N1}" kill -HUP 1

## nats/reload-n2: reloads the n2 server configuration
.PHONY: nats/reload-n2
nats/reload-n2:
	@docker exec -it "${NATS_N2}" kill -HUP 1

## nats/reload-n3: reloads the n3 server configuration
.PHONY: nats/reload-n3
nats/reload-n3:
	@docker exec -it "${NATS_N3}" kill -HUP 1

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

## cmp/restart: restart service containers
.PHONY: cmp/restart
cmp/restart:
	@docker compose restart

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
	@telnet "${NATS_NODE_IP_ADDR}" 4222

# ==============================================================================