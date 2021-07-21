all: dev

clean:
	@echo "cleaning volumes"
	docker volume rm $(docker volume ls -q)

copy:

ifeq (,$(wildcard ./.env))
	@echo "Copying .env file"
	cp .env.example .env
endif

dev: copy
	@echo "Starting Dev"
	docker-compose up -d

down: copy
	@echo "Shutting Down Dev"
	docker-compose down -v

test:
	@echo "Testing product"
	bin/rails test 