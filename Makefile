
docker-build:
	docker-compose build

server:
	docker-compose run --rm --service-ports app bash

tester:
	docker-compose run --rm tester bash

pip-compile:
	pip-compile requirements.in
	pip-compile requirements-dev.in

test:
	nosetests
