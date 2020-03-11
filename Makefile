IMAGE=kakeibo:1.0
CONTAINER=kakeibo

all:
	-sudo docker rmi $(IMAGE)
	sudo docker build -t $(IMAGE) .
	make run
	
run:
	-sudo docker stop $(CONTAINER)
	-sudo docker rm $(CONTAINER)
	sudo docker run -p 8083:8083 --name $(CONTAINER) -dit $(IMAGE)

clean:
	-sudo docker rmi `sudo docker images -f "dangling=true" -q`
	-sudo docker rm `sudo docker ps -qaf status=exited`