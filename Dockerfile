FROM openjdk:8-alpine

# #Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY qlik_replicate.yml $PROJECT_HOME/qlik_replicate.jar

WORKDIR $PROJECT_HOME

CMD ["java" , "-jar", "./sprint-qlik_replicate.jar"]
