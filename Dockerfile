# DOCKER-VERSION 0.7.1
FROM      kaczmarczyka/ubuntu-jdk:master
MAINTAINER Adam Kaczmarczyk <kaczmarczyk.a@gmail.com>

ENV HTTP_PORT 8080
ENV JAR_URL http://docker:5080/job/presscon/ws/presscon/target/
ENV JAR_FILE presscon-0.0.1-SNAPSHOT.war
ENV DIR_PATH	/spring-boot

# start SSHD
RUN service ssh start

RUN mkdir $DIR_PATH

WORKDIR $DIR_PATH

RUN wget ${JAR_URL}${JAR_FILE}

# expose the SSHD port, and HTTP port
EXPOSE	22 $HTTP_PORT
CMD    java -jar $JAR_FILE --server.port=$HTTP_PORT