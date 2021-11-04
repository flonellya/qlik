FROM openjdk:8-alpine

# #Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY qlik-application $PROJECT_HOME/qlik-application.jar

WORKDIR $PROJECT_HOME

CMD ["java" , "-jar", "./sprint-qlik-application.jar"]
