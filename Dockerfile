FROM ubuntu:latest

RUN apt update
RUN apt install curl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
