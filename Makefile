IMAGE=kakeibo:1.0
CONTAINER=kakeibo

all:
	-docker rmi $(IMAGE)
	docker build -t $(IMAGE) .
	make run
	
run:
	-docker stop $(CONTAINER)
	-docker rm $(CONTAINER)
	mkdir -p db
	docker run -p 127.0.0.1:8089:8080 -v `readlink -f ./db/`:/kakeibo-back/db/ --name $(CONTAINER) -dit $(IMAGE) npm run --prefix /kakeibo-back/ serve

clean:
	-docker rmi `docker images -f "dangling=true" -q`
	-docker rm `docker ps -qaf status=exited`
