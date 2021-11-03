FROM openjdk:8-alpine

# #Required for starting application up.

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/qlik-deployment-1.0jar $PROJECT_HOME/qlik-deployment.jar

WORKDIR $PROJECT_HOME

CMD ["java" , "-jar","./qlik-deployment.jar"]
