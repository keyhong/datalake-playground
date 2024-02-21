build:
	docker build -t hadoop-base -f ./base-images/hadoop/Dockerfile . \
	&& docker build -t hive-base -f base-images/hive/Dockerfile .

up:
	docker compose -f docker-compose.yml up --build -d --remove-orphans

down:
	docker-compose -f docker-compose.yml down

delete-all:
	docker compose -f docker-compose.yml down -v --rmi all
	rm -rf ./mnt/hadoop/*
	rm -rf ./mnt/mysql/*
	rm -rf ./mnt/schematool-check/*
