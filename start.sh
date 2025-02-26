mvn clean package -Dmaven.test.skip=true
docker ps -aq --filter "name=admin-service" | xargs -r docker rm -f
docker system prune -a -f
docker build -t sergeiavdeev/admin-service:1-dev .
PROFILE=dev TAG=1-dev docker compose up -d
docker system prune -a -f