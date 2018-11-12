# Docker flask

## pre-install
install docker toolbox

create a docker-machine if necessary (you're not on a linux machine)

## install
```bash
make docker-build
```

## start a development server
```bash
docker-compose up -d # to start
docker-compse down # to kill
```

## start an interactive development server
```bash
make server
```

## start a testing container
this container will not be externally accessible, but includes the dependencies in 
requirements-dev.txt and is capable of running automated tests on the project
```bash
make tester
# you'll be attached to a tty in the container, then:
make test # to run tests
```

## Update dependencies
install pip-tools
```bash
pip install --upgrade pip-tools
```
add or update a line in `requirements.in` with your new dependency and version

then run:
```bash
make pip-compile
```

for dependencies that are only needed in development or for running automated tests, 
follow the same process but instead add the new dependency to `requirements-dev.in`

If you need these updated dependencies in your development docker environment, run:
```bash
make docker-build
```
