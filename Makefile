SRC = cd srcs && docker-compose -f docker-compose.yml

start:
	@sudo echo "127.0.0.1 mda-silv.42.fr" | sudo tee -a /etc/hosts 
	@cd /home/$(USER)/ ; mkdir -pv data; cd data ; mkdir -pv mariadb wordpress
	@cd /home/$(USER)/data/ ; chmod 777 mariadb wordpress
	$(SRC) up -d

down:
	$(SRC) down

re:
	$(SRC) up --build -d

stop:
	$(SRC) stop

ps:
	$(SRC) ps

del :
	@sudo rm -rf /home/$(USER)/data

clean:
	$(SRC) down

fclean: clean del
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q) \
	docker system prune -a --force \

.PHONY: start down stop
