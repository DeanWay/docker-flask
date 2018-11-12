
docker-build:
	docker-compose build

db:
	docker-compose up -d db

server: db
	docker-compose run --rm --service-ports app bash

tester: db
	docker-compose run --rm tester bash

pip-compile:
	pip-compile --generate-hashes --output-file requirements.txt requirements.in
	pip-compile --generate-hashes --output-file requirements-dev.txt requirements-dev.in

test:
	nosetests
