This project is a minimal Spring Boot web application built with a **strong focus on CI/CD security**. It demonstrates how to secure every stage of a typical DevOps pipeline — from code checkout to deployment.

Because CI/CD is great — but **secure CI/CD** is better.

---

## Project Overview

- **Framework**: Spring Boot 3.5.3
- **Language**: Java 17  
- **CI/CD**: GitHub Actions  
- **Security**: Static analysis, container security, secrets management
- **Deployment**: Docker + SSH to VPS

---

## What It Does

This pipeline does the following automatically every time you push to `main`:

1. Checkout code with **no write credentials**
2. Set up **Java 17** (Temurin distribution)
3. Run **unit tests** with Maven
4. Perform **static code analysis** using Sonarcloud
5. Build a **Docker image**
6. Scan the image for vulnerabilities with **Trivy**
   Push the image to **Docker Hub**
   Deploy to a **remote VPS** over SSH using a secure key
---

## Technologies Used

| Tool         | Purpose                          |
|--------------|----------------------------------|
| GitHub Actions | CI/CD automation               |
| Maven         | Build tool & test runner        |
| SonarCloud    | Static code analysis (SAST)     |
| Trivy         | Container security scanning     |
| Docker        | Containerization                |
| SSH           | Remote deployment               |

---

## Secrets Used (GitHub Actions)

Ensure the following secrets are added to your GitHub repository:

| Secret Name            | Purpose                          |
|------------------------|----------------------------------|
| `SONAR_TOKEN`          | Auth token for SonarCloud        |
| `DOCKER_USERNAME`      | Docker Hub username              |
| `DOCKER_PASSWORD`      | Docker Hub password/token        |
| `HOST`                 | IP or domain of your VPS         |
| `USERNAME`             | SSH username on VPS              |
| `SSH_PRIVATE_KEY`      | Your private SSH deployment key  |

---

## Running Locally

```bash
# Build and run the Spring Boot app
mvn clean install
mvn spring-boot:run
