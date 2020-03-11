IMAGE=kakeibo:1.0
CONTAINER=kakeibo

all:
	-sudo docker rmi $(IMAGE)
	sudo docker build -t $(IMAGE) .
	make run
	
run:
	-sudo docker stop $(CONTAINER)
	-sudo docker rm $(CONTAINER)
	sudo docker run -p 127.0.0.1:8089:8080 --name $(CONTAINER) -dit $(IMAGE) npm run --prefix /kakeibo-back/ serve

clean:
	-sudo docker rmi `sudo docker images -f "dangling=true" -q`
	-sudo docker rm `sudo docker ps -qaf status=exited`
