# Projet Todo List

Application de gestion de tâches développée avec Spring Boot.

## Architecture
- **Backend** : Spring Boot (Java 17)
- **Base de données** : PostgreSQL
- **Conteneurisation** : Docker

## Structure du projet
- `backend/` : code source de l'API Spring Boot
- `docker/` : fichiers de configuration Docker
- `docs/` : documentation du projet

## Deployment

### Run everything locally
cp .env.example .env
docker compose up -d --build

### Private registry
docker run -d --name registry --restart unless-stopped -p 5000:5000 -v registry-data:/var/lib/registry registry:2
docker tag todo-backend localhost:5000/todo-backend:1.0
docker push localhost:5000/todo-backend:1.0

### From a remote server
Declare the registry as insecure (HTTP) in /etc/docker/daemon.json:
{ "insecure-registries": ["192.168.56.10:5000"] }
then:
docker pull 192.168.56.10:5000/todo-backend:1.0
docker run -d -p 8080:8080 192.168.56.10:5000/todo-backend:1.0

### Evidence
- docs/evidence-projet-todo.txt: status of the project and the registry
- docs/evidence-remote-server.txt: deployment from the registry to the remote server
- scripts/verify.sh: script that generates this evidence
