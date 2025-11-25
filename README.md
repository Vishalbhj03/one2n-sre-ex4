Exercise 4 – CI Pipeline Setup

This repository contains Exercise 4 of the One2N SRE Bootcamp.
The goal of this exercise is to set up a CI pipeline using GitHub Actions and a self-hosted runner.

What this exercise includes

A GitHub Actions workflow (ci.yml)

A self-hosted runner that runs the CI pipeline

A CI pipeline that does:

Build the API

Run tests

Lint the code

Login to Docker Hub

Build Docker image

Push Docker image

Workflow file

The workflow is defined at:

.github/workflows/ci.yml


It runs automatically on code changes and can also be triggered manually using Run workflow.

Required secrets

You must add these secrets under:

Settings → Secrets and variables → Actions

DOCKER_USERNAME

DOCKER_PASSWORD

Self-hosted runner

A Linux, X64 self-hosted runner is configured locally and connected to this repository.
The CI runs only on this runner.
