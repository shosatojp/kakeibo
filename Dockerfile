FROM ubuntu:18.04
RUN apt update && apt install -y git sudo curl
RUN apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates \
    && curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
    && apt install nodejs -y
ADD https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h skipcache
RUN mkdir kakeibo-back && npm i express@4.17.1 sqlite3@4.1.1
RUN git clone https://github.com/shosatojp/kakeibo-front
RUN git clone https://github.com/shosatojp/kakeibo-back kakeibo-back
#CMD cd kakeibo-back && npm run serve
EXPOSE 8080
