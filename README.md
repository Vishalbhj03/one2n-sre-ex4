# CI Pipeline Setup — Student REST API

This project provides a Continuous Integration (CI) setup using:

- GitHub Actions  
- Self-Hosted GitHub Runner  
- Docker  
- Docker Hub Registry  
- GNU Make  
- Spring Boot  
- Maven  

---

##  Prerequisites

Install:

- Git  
- Docker  
- Docker Compose (v2+)  
- GNU Make  
- Java 17+  
- Maven  
- GitHub self-hosted runner (Linux, X64)  

Check installation:

```bash
docker --version
docker compose version
make --version
mvn --version
java -version
```

---

##  CI Workflow

The CI pipeline performs:

- Checkout code  
- Build the API  
- Run tests  
- Lint code  
- Login to Docker Hub  
- Build Docker image  
- Push Docker image  

The workflow file is located at:

```
.github/workflows/ci.yml
```

---

##  Workflow Triggers

The CI pipeline runs when changes are made to:

- src/**
- pom.xml
- Dockerfile
- Makefile
- docker-compose.yml

It can also be triggered manually using **Run workflow**.

---

##  Required GitHub Secrets

Add these under:

Settings → Secrets and variables → Actions

- DOCKER_USERNAME  
- DOCKER_PASSWORD  

These are used for Docker login inside the CI workflow.

---

##  Self-Hosted Runner

A Linux, X64 self-hosted runner must be configured and running.

Start runner:

```bash
./run.sh
```

Check runner status:

GitHub → Repository → Settings → Actions → Runners

You should see:

- Labels: self-hosted, Linux, X64  
- Status:  Idle  

---

##  Makefile Commands Used in CI

```bash
make build
make test
make lint
make docker-login
make docker-build
make docker-push
```

---

##  Outcome

After completing this exercise, the project now has:

- Automated CI pipeline  
- Build, test, and lint verification  
- Docker image build automation  
- Automatic image push to Docker Hub  
- Self-hosted runner support  

This completes **Exercise 4 — CI Pipeline Setup**.

