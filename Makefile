#
# This is a generic Makefile. It use to build Docker images.
#

all: build

build:
	   @docker build -t qxip/docker-hepswitch .

quickstart:
	@echo "Quick starting sample"
	@docker run --name opensips -d -p 5060:5060/udp \
	-e ADVERTISED_IP="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')" \
	qxip/docker-hepswitch
