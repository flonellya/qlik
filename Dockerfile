FROM openjdk:8-alpine

# #Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/spring-boost-mongo-1.0jar $PROJECT_HOME/spring-boost-mongo.jar

WORKDIR $PROJECT_HOME

CMD ["java" , "-jar","./spring-boost-mongo.jar"]
