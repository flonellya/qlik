FROM openjdk:8-alpine

# #Required for starting application up.

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

#COPY /usr/share/man/man1/jar/1/gz $PROJECT_HOME/qlik-deployment.jar

WORKDIR $PROJECT_HOME

CMD ["java" , "-jar", "target/qlik-deployment.jar"]
