FROM openjdk:8-alpine

# #Required for starting application up.

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/qlik-deployment $PROJECT_HOME/qlik-deployment

WORKDIR $PROJECT_HOME

CMD ["java" , "-jar","./qlik-deployment"]
