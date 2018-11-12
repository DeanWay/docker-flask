
docker-build:
	docker-compose build

server:
	docker-compose run --rm --service-ports app bash

tester:
	docker-compose run --rm tester bash

pip-compile:
	pip-compile --generate-hashes --output-file requirements.txt requirements.in
	pip-compile --generate-hashes --output-file requirements-dev.txt requirements-dev.in

test:
	nosetests
