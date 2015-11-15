# DOCKER-VERSION 0.7.1
FROM      kaczmarczyka/ubuntu-jdk:master
MAINTAINER Adam Kaczmarczyk <kaczmarczyk.a@gmail.com>

ENV HTTP_PORT 8080
ENV DIR_PATH	/spring-boot

# start SSHD
RUN service ssh start

RUN mkdir $DIR_PATH

WORKDIR $DIR_PATH

# expose the SSHD port, and HTTP port
EXPOSE	22 $HTTP_PORT
CMD rm ${JAR_FILE}; wget ${JAR_URL}${JAR_FILE}; java -jar $JAR_FILE --server.port=$HTTP_PORT