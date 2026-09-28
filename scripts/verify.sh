#!/bin/bash
run() { echo; echo "\$ $*"; eval "$*" 2>&1; echo; }
echo "=== $(hostname) - $(date) ==="
run "docker --version"
run "docker compose version"
case "$(hostname)" in
  projet-todo)
    run "git log --oneline"
    run "cat backend/Dockerfile"
    run "cat docker-compose.yml"
    run "docker compose ps"
    run "curl -s http://localhost:8080/api/health"
    run "curl -s http://localhost:8080/api/tasks"
    run "curl -s http://localhost:5000/v2/_catalog"
    run "curl -s http://localhost:5000/v2/todo-backend/tags/list"
    ;;
  remote-server)
    run "docker images"
    run "docker image inspect --format '{{index .RepoDigests 0}}' 192.168.56.10:5000/todo-backend:1.0"
    run "docker ps"
    run "curl -s http://localhost:8080/api/health"
    run "curl -s http://localhost:8080/api/tasks"
    run "curl -s http://192.168.56.10:5000/v2/_catalog"
    ;;
esac
