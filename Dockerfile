FROM ubuntu:latest

RUN apt update
RUN apt install -y curl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
