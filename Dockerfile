FROM openjdk:8-alpine

# #Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY sprint-qlik-application $PROJECT_HOME/sprint-qlik-application.jar

WORKDIR $PROJECT_HOME

CMD ["java" , "-jar", "./sprint-qlik-application.jar"]
