RAILS = web
DB = db
DB_DEVELOP = app_development
help:
	cat Makefile
init:
	$(MAKE) build
	$(MAKE) install
	docker-compose run $(RAILS) rails db:create
	docker-compose run $(RAILS) rails db:migrate
down:
	docker-compose down
up:
	docker-compose up
install:
	docker-compose run $(RAILS) bundle install
start:
	docker-compose start
ssh_rails:
	docker-compose exec $(RAILS) /bin/sh
ssh_db:
	docker-compose exec $(DB) mysql -u root -p
console:
	docker-compose exec $(RAILS) bundle exec rails c
migrate:
	docker-compose exec rails bash -c 'rails db:migrate'
build:
	docker-compose build
logs:
	docker-compose logs -f -t
