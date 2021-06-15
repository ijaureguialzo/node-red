help:
	@echo Opciones:
	@echo -------------------
	@echo start / stop / restart / stop-all
	@echo workspace
	@echo update
	@echo stats
	@echo clean
	@echo -------------------

_start-command:
	@docker-compose up -d --remove-orphans

start: _start-command _urls

stop:
	@docker-compose stop

restart: stop start

stop-all:
	@docker stop `docker ps -aq`

workspace:
	@docker-compose exec node-red /bin/bash

_build:
	@docker-compose pull

update: _build start

stats:
	@docker stats

clean:
	@docker-compose down -v --remove-orphans

_urls:
	${info }
	@echo -------------------
	@echo [Modbus TCP Server] tcp://localhost:5020
	@echo [Node-RED] http://localhost:1880
	@echo -------------------
