APP_NAME = SpringBootRestAPIProject
PORT ?= 8087

DOCKER_USERNAME = Vishalbhj
IMAGE_NAME = $(DOCKER_USERNAME)/student-rest-api
VERSION ?= 1.0.0

.PHONY: build run test migrate clean db-start db-migrate docker-build api-run lint docker-login docker-push all

# Maven Commands
build:
	mvn -B -q -DskipTests package

run:
	mvn spring-boot:run

test:
	mvn -B -q test

migrate:
	mvn -B -q flyway:migrate

clean:
	mvn -B -q clean

# Lint step for CI (basic check)
lint:
	mvn -B -q verify

# Docker Compose Commands
db-start:
	docker compose up -d db

db-migrate:
	mvn -B -q flyway:migrate

docker-build:
	docker build -t $(IMAGE_NAME):$(VERSION) .

api-run: db-start db-migrate
	docker compose up -d api

# Docker Hub login & push (used by CI)
docker-login:
	echo "$(DOCKER_PASSWORD)" | docker login -u "$(DOCKER_USERNAME)" --password-stdin

docker-push:
	docker push $(IMAGE_NAME):$(VERSION)

# Full CI pipeline in one command
all: build test lint docker-login docker-build docker-push
