.PHONY: build
build:
	@ echo "docker build hadoop-base image"
	@ docker build -t hadoop-base -f ./base-images/hadoop/Dockerfile .
	@ echo "docker build hive-base image"
	@ docker build -t hive-base -f base-images/hive/Dockerfile .

.PHONY: up
up:
	@ echo "docker compose docker-compose.yml up"
	docker compose -f docker-compose.yml up --build -d --remove-orphans

.PHONY: down
down:
	@ echo "docker compose docker-compose.yml down"
	docker-compose -f docker-compose.yml down

.PHONY: delete.a
delete.all:
	@ echo "docker compose docker-compose.yml down"
	docker compose -f docker-compose.yml down -v --rmi all
	@ echo "remove ./mnt/hadoop/*, ./mnt/mysql/*, ./mnt/schematool-check/*"
	rm -rf ./mnt/hadoop/* ./mnt/mysql/* ./mnt/schematool-check/*
