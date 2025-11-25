CI Pipeline Setup — Student REST API

This exercise adds a Continuous Integration (CI) pipeline to the Student REST API project using:

GitHub Actions

Self-hosted GitHub Runner

Docker Hub Registry

Makefile automation

The pipeline automatically builds, tests, lints, and publishes the Docker image whenever code changes are made.

Prerequisites

Install on your system:

Git

Docker

Docker Compose (v2+)

GNU Make

Java 17+

Maven

GitHub self-hosted runner (configured & running)

Check installation:

docker --version
docker compose version
make --version
mvn --version
java -version

CI Workflow Overview

The CI workflow performs:

Checkout code

Build API using make build

Run tests using make test

Lint code using make lint

Login to Docker Hub

Build Docker image

Push Docker image to registry

The workflow is defined at:

.github/workflows/ci.yml

Triggering the Pipeline

The CI pipeline runs when:

Code changes are pushed to files such as:

src/**

pom.xml

Makefile

Dockerfile

docker-compose.yml

OR manually using:

GitHub → Actions → CI - Build Test Lint Docker → Run workflow

Required GitHub Secrets

Add the following secrets under:

Settings → Secrets and variables → Actions

DOCKER_USERNAME → Your Docker Hub username

DOCKER_PASSWORD → Docker Hub Access Token

These are used for logging into Docker Hub during the pipeline.

Self-Hosted Runner Setup

A self-hosted runner is required to run the workflow.

Runner labels:

self-hosted

Linux

X64

Make sure your runner is running via:

./run.sh


You should see it as  Idle in:

GitHub → Repository → Settings → Actions → Runners

Makefile Targets Used by CI

The workflow uses these commands:

make build          # Build API (Maven)
make test           # Run tests
make lint           # Lint code
make docker-login   # Login to Docker registry
make docker-build   # Build Docker image
make docker-push    # Push Docker image

Outcome

By completing this exercise, your project now has:

Automated build pipeline

Test execution on every change

Docker image build automation

Automatic push to Docker Hub

Self-hosted runner handling all CI tasks
