# Laravel Docker Swarm Stack 🚀

A complete example of running a **Laravel** application in a **Docker Swarm** environment with monitoring, logging, and management capabilities.

---

## 🧱 Service Overview

| Service     | Local Port        | Description                                |
|-------------|-------------------|--------------------------------------------|
| Laravel App | -                 | Laravel app running on PHP-FPM             |
| Nginx       | `80`, `443`       | Web server forwarding requests to Laravel  |
| MySQL       | `127.0.0.1:3306`  | MySQL database (`user: laravel`, `pass: laravel`) |
| Redis       | `6379`            | Cache and queue                            |
| Portainer   | `9000`            | Visual Docker Swarm manager                |
| Prometheus  | `9090`            | Real-time metrics collection               |
| Grafana     | `3000`            | Dashboard for monitoring via Prometheus    |

---

## 🔧 Installation

1. **Initialize Docker Swarm** (if not already done):
   ```bash
   docker swarm init

## 🔧 Deploy
    
    docker stack deploy -c docker-compose.yml laravel-stack

Service Status

docker service ls



🔁 تست CI/CD خودکار
